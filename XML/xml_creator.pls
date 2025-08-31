SELECT xmlelement(
    NAME "Cities",
    xmlagg(
        xmlelement(
            NAME "City",
            xmlforest(
                c.city_id AS "CityID",
                c.city AS "CityName",
                (SELECT xmlagg(
					xmlforest(
						o.country_id AS "CountryID",
						o.country AS "CountryName"
					)
                ) FROM country o WHERE o.country_id = c.country_id) AS "Country"
            )
        )
    )
)
FROM city c;
