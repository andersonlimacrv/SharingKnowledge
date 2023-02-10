~~~sql
CREATE FUNCTION sample_function(created_at TIMESTAMP, some_field VARCHAR)
RETURNS VARCHAR AS $$
    BEGIN
        IF created_at >= '2023-01-01' THEN
            IF some_field = 'Yes' OR another_field IS NOT NULL THEN
                RETURN 'good';
            ELSE
                RETURN 'awesome';
            END IF;
        ELSE
            IF some_field = 'Yes' OR another_field_1 IS NOT NULL OR another_field_2 IS NULL THEN
                RETURN 'good';
            ELSE
                RETURN 'awesome';
            END IF;
        END IF;
    END;
$$ LANGUAGE plpgsql;
~~~

### function options
~~~html
- IMMUTABLE: The function always returns the same result for the same input. It does not access any data other than its input arguments and does not have any side effects.
- STABLE: The function will return the same result for the same input during a single query execution, but can return different results for the same input in different executions.
- VOLATILE: The function can return different results for the same input in different executions or even within the same query.
~~~

### errors
1. ERROR: create function must specify volatility attribute (IMMUTABLE|STABLE|VOLATILE)

~~~sql
CREATE FUNCTION sample_function(created_at TIMESTAMP, some_field VARCHAR)
RETURNS VARCHAR STABLE AS $$
  BEGIN
    -- BLOCK CODE
  END;
$$ LANGUAGE plpgsql;
~~~

2. ERROR: language plpgsql not supported for CREATE FUNCTION
~~~sql
REATE FUNCTION sample_function(created_at TIMESTAMP, some_field VARCHAR)
RETURNS VARCHAR STABLE AS $$
  BEGIN
    -- BLOCK CODE
  END;
$$ LANGUAGE SQL;
~~~

3. Syntax Error: at or near "IF"
~~~sql
CREATE FUNCTION instapay_enabled_function(created_at TIMESTAMP, free_plan VARCHAR,
blacklisted_uuid VARCHAR, whitelisted_uuid VARCHAR)
RETURNS VARCHAR STABLE AS
$$
    CASE
        WHEN created_at >= '2023-01-01' THEN
            CASE
                WHEN some_field = 'Yes' OR another_field IS NOT NULL THEN 'OFF'
                ELSE 'ON'
            END
        ELSE
            CASE
                WHEN some_field = 'Yes' OR another_field IS NOT NULL OR another_field_1 IS NULL THEN 'OFF'
                ELSE 'ON'
            END
    END;
$$ LANGUAGE SQL;
~~~

4. Conclusion:
- In Redshift, you can't create a function that returns a single value based on the input
