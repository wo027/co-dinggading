DELETE duplicated_person
FROM
    Person AS origin_person
        INNER JOIN Person AS duplicated_person
            ON origin_person.email = duplicated_person.email
                AND origin_person.id < duplicated_person.id
;