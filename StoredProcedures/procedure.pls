CREATE OR REPLACE PROCEDURE get_films_by_year(
    release_year_arg INTEGER,
    OUT film_result RECORD
)
LANGUAGE plpgsql
AS $$
DECLARE
    MIN_LENGTH CONSTANT INTEGER := 80;
    film_record film%ROWTYPE;
    film_cursor CURSOR FOR
        SELECT "film_id", "title", "length" AS "duration"
        FROM film
        WHERE "release_year" = release_year_arg AND "length" > MIN_LENGTH;
BEGIN
    IF release_year_arg < 1900 OR release_year_arg > 2023 THEN
        RAISE EXCEPTION 'Year should be between 1900 and 2023';
    ELSE
        OPEN film_cursor;
        LOOP
            FETCH film_cursor INTO film_record;
            EXIT WHEN NOT FOUND;

            film_result := film_record;

            -- RAISE NOTICE 'Film ID: %, Title: %',
            --    film_result.film_id, film_result.title;
        END LOOP;

        CLOSE film_cursor;
    END IF;
END;
$$;








DO $$
DECLARE
    film_output RECORD;
BEGIN
    film_output := ROW(NULL::integer, NULL::text, NULL::integer);

    CALL get_films_by_year2(2006, film_output);

    IF film_output IS NOT NULL THEN
        RAISE NOTICE 'Film ID: %, Title: %', film_output.film_id, film_output.title;
    ELSE
        RAISE NOTICE 'No films found for the specified year and criteria.';
    END IF;
END;
$$;
