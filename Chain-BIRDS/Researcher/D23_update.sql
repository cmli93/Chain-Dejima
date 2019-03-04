CREATE OR REPLACE VIEW public.d23_researanddoc AS 
SELECT __dummy__.COL0 AS MEDICATIONNAME,__dummy__.COL1 AS MECHANISMOFACTION 
FROM (SELECT DISTINCT d23_researanddoc_a2_0.COL0 AS COL0, d23_researanddoc_a2_0.COL1 AS COL1 
FROM (SELECT DISTINCT d2_researcher_a4_0.MEDICATIONNAME AS COL0, d2_researcher_a4_0.MECHANISMOFACTION AS COL1 
FROM public.d2_researcher AS d2_researcher_a4_0 
WHERE d2_researcher_a4_0.SHAREDWITHDOCTORORNOT = 'Yes' ) AS d23_researanddoc_a2_0  ) AS __dummy__;

DROP MATERIALIZED VIEW IF EXISTS public.__dummy__materialized_d23_researanddoc;

CREATE  MATERIALIZED VIEW public.__dummy__materialized_d23_researanddoc AS 
SELECT * FROM public.d23_researanddoc;

CREATE OR REPLACE FUNCTION public.d23_researanddoc_delta_action()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
  DECLARE
  text_var1 text;
  text_var2 text;
  text_var3 text;
  temprecΔ_del_d2_researcher public.d2_researcher%ROWTYPE;
temprecΔ_ins_d2_researcher public.d2_researcher%ROWTYPE;
  BEGIN
    IF NOT EXISTS (SELECT * FROM information_schema.tables WHERE table_name = 'd23_researanddoc_delta_action_flag') THEN
        -- RAISE NOTICE 'execute procedure d23_researanddoc_delta_action';
        CREATE TEMPORARY TABLE d23_researanddoc_delta_action_flag ON COMMIT DROP AS (SELECT true as finish);
        IF EXISTS (SELECT WHERE false )
        THEN 
          RAISE check_violation USING MESSAGE = 'Invalid update on view';
        END IF;
        CREATE TEMPORARY TABLE Δ_del_d2_researcher WITH OIDS ON COMMIT DROP AS SELECT (ROW(COL0,COL1,COL2,COL3) :: public.d2_researcher).* 
            FROM (SELECT DISTINCT Δ_del_d2_researcher_a4_0.COL0 AS COL0, Δ_del_d2_researcher_a4_0.COL1 AS COL1, Δ_del_d2_researcher_a4_0.COL2 AS COL2, Δ_del_d2_researcher_a4_0.COL3 AS COL3 
FROM (SELECT DISTINCT d2_researcher_a4_0.MEDICATIONNAME AS COL0, d2_researcher_a4_0.MECHANISMOFACTION AS COL1, d2_researcher_a4_0.MODEOFACTION AS COL2, d2_researcher_a4_0.SHAREDWITHDOCTORORNOT AS COL3 
FROM public.d2_researcher AS d2_researcher_a4_0 
WHERE d2_researcher_a4_0.SHAREDWITHDOCTORORNOT = 'Yes' AND NOT EXISTS ( SELECT * 
FROM (SELECT DISTINCT __dummy__materialized_d23_researanddoc_a2_0.MEDICATIONNAME AS COL0, __dummy__materialized_d23_researanddoc_a2_0.MECHANISMOFACTION AS COL1 
FROM public.__dummy__materialized_d23_researanddoc AS __dummy__materialized_d23_researanddoc_a2_0 
WHERE NOT EXISTS ( SELECT * 
FROM __temp__Δ_del_d23_researanddoc AS __temp__Δ_del_d23_researanddoc_a2 
WHERE __temp__Δ_del_d23_researanddoc_a2.MECHANISMOFACTION IS NOT DISTINCT FROM __dummy__materialized_d23_researanddoc_a2_0.MECHANISMOFACTION AND __temp__Δ_del_d23_researanddoc_a2.MEDICATIONNAME IS NOT DISTINCT FROM __dummy__materialized_d23_researanddoc_a2_0.MEDICATIONNAME )  UNION SELECT DISTINCT __temp__Δ_ins_d23_researanddoc_a2_0.MEDICATIONNAME AS COL0, __temp__Δ_ins_d23_researanddoc_a2_0.MECHANISMOFACTION AS COL1 
FROM __temp__Δ_ins_d23_researanddoc AS __temp__Δ_ins_d23_researanddoc_a2_0  ) AS d23_researanddoc_a2 
WHERE d23_researanddoc_a2.COL1 IS NOT DISTINCT FROM d2_researcher_a4_0.MECHANISMOFACTION AND d23_researanddoc_a2.COL0 IS NOT DISTINCT FROM d2_researcher_a4_0.MEDICATIONNAME ) ) AS Δ_del_d2_researcher_a4_0  ) AS Δ_del_d2_researcher_extra_alias;

CREATE TEMPORARY TABLE Δ_ins_d2_researcher WITH OIDS ON COMMIT DROP AS SELECT (ROW(COL0,COL1,COL2,COL3) :: public.d2_researcher).* 
            FROM (SELECT DISTINCT Δ_ins_d2_researcher_a4_0.COL0 AS COL0, Δ_ins_d2_researcher_a4_0.COL1 AS COL1, Δ_ins_d2_researcher_a4_0.COL2 AS COL2, Δ_ins_d2_researcher_a4_0.COL3 AS COL3 
FROM (SELECT DISTINCT d23_researanddoc_a2_1.COL0 AS COL0, d23_researanddoc_a2_1.COL1 AS COL1, d2_researcher_a4_0.MODEOFACTION AS COL2, d2_researcher_a4_0.SHAREDWITHDOCTORORNOT AS COL3 
FROM public.d2_researcher AS d2_researcher_a4_0, (SELECT DISTINCT __dummy__materialized_d23_researanddoc_a2_0.MEDICATIONNAME AS COL0, __dummy__materialized_d23_researanddoc_a2_0.MECHANISMOFACTION AS COL1 
FROM public.__dummy__materialized_d23_researanddoc AS __dummy__materialized_d23_researanddoc_a2_0 
WHERE NOT EXISTS ( SELECT * 
FROM __temp__Δ_del_d23_researanddoc AS __temp__Δ_del_d23_researanddoc_a2 
WHERE __temp__Δ_del_d23_researanddoc_a2.MECHANISMOFACTION IS NOT DISTINCT FROM __dummy__materialized_d23_researanddoc_a2_0.MECHANISMOFACTION AND __temp__Δ_del_d23_researanddoc_a2.MEDICATIONNAME IS NOT DISTINCT FROM __dummy__materialized_d23_researanddoc_a2_0.MEDICATIONNAME )  UNION SELECT DISTINCT __temp__Δ_ins_d23_researanddoc_a2_0.MEDICATIONNAME AS COL0, __temp__Δ_ins_d23_researanddoc_a2_0.MECHANISMOFACTION AS COL1 
FROM __temp__Δ_ins_d23_researanddoc AS __temp__Δ_ins_d23_researanddoc_a2_0  ) AS d23_researanddoc_a2_1 
WHERE d23_researanddoc_a2_1.COL0 = d2_researcher_a4_0.MEDICATIONNAME AND d2_researcher_a4_0.SHAREDWITHDOCTORORNOT = 'Yes' AND d2_researcher_a4_0.MECHANISMOFACTION  IS DISTINCT FROM  d23_researanddoc_a2_1.COL1  UNION SELECT DISTINCT d2_researcher_a4_0.MEDICATIONNAME AS COL0, d2_researcher_a4_0.MECHANISMOFACTION AS COL1, d2_researcher_a4_0.MODEOFACTION AS COL2, 'No' AS COL3 
FROM public.d2_researcher AS d2_researcher_a4_0 
WHERE d2_researcher_a4_0.SHAREDWITHDOCTORORNOT = 'Yes' AND NOT EXISTS ( SELECT * 
FROM (SELECT DISTINCT __dummy__materialized_d23_researanddoc_a2_0.MEDICATIONNAME AS COL0, __dummy__materialized_d23_researanddoc_a2_0.MECHANISMOFACTION AS COL1 
FROM public.__dummy__materialized_d23_researanddoc AS __dummy__materialized_d23_researanddoc_a2_0 
WHERE NOT EXISTS ( SELECT * 
FROM __temp__Δ_del_d23_researanddoc AS __temp__Δ_del_d23_researanddoc_a2 
WHERE __temp__Δ_del_d23_researanddoc_a2.MECHANISMOFACTION IS NOT DISTINCT FROM __dummy__materialized_d23_researanddoc_a2_0.MECHANISMOFACTION AND __temp__Δ_del_d23_researanddoc_a2.MEDICATIONNAME IS NOT DISTINCT FROM __dummy__materialized_d23_researanddoc_a2_0.MEDICATIONNAME )  UNION SELECT DISTINCT __temp__Δ_ins_d23_researanddoc_a2_0.MEDICATIONNAME AS COL0, __temp__Δ_ins_d23_researanddoc_a2_0.MECHANISMOFACTION AS COL1 
FROM __temp__Δ_ins_d23_researanddoc AS __temp__Δ_ins_d23_researanddoc_a2_0  ) AS d23_researanddoc_a2 
WHERE d23_researanddoc_a2.COL0 IS NOT DISTINCT FROM d2_researcher_a4_0.MEDICATIONNAME )  UNION SELECT DISTINCT d23_researanddoc_a2_0.COL0 AS COL0, d23_researanddoc_a2_0.COL1 AS COL1, 'to be added' AS COL2, 'Yes' AS COL3 
FROM (SELECT DISTINCT __dummy__materialized_d23_researanddoc_a2_0.MEDICATIONNAME AS COL0, __dummy__materialized_d23_researanddoc_a2_0.MECHANISMOFACTION AS COL1 
FROM public.__dummy__materialized_d23_researanddoc AS __dummy__materialized_d23_researanddoc_a2_0 
WHERE NOT EXISTS ( SELECT * 
FROM __temp__Δ_del_d23_researanddoc AS __temp__Δ_del_d23_researanddoc_a2 
WHERE __temp__Δ_del_d23_researanddoc_a2.MECHANISMOFACTION IS NOT DISTINCT FROM __dummy__materialized_d23_researanddoc_a2_0.MECHANISMOFACTION AND __temp__Δ_del_d23_researanddoc_a2.MEDICATIONNAME IS NOT DISTINCT FROM __dummy__materialized_d23_researanddoc_a2_0.MEDICATIONNAME )  UNION SELECT DISTINCT __temp__Δ_ins_d23_researanddoc_a2_0.MEDICATIONNAME AS COL0, __temp__Δ_ins_d23_researanddoc_a2_0.MECHANISMOFACTION AS COL1 
FROM __temp__Δ_ins_d23_researanddoc AS __temp__Δ_ins_d23_researanddoc_a2_0  ) AS d23_researanddoc_a2_0 
WHERE NOT EXISTS ( SELECT * 
FROM public.d2_researcher AS d2_researcher_a4 
WHERE d2_researcher_a4.MEDICATIONNAME IS NOT DISTINCT FROM d23_researanddoc_a2_0.COL0 ) ) AS Δ_ins_d2_researcher_a4_0  ) AS Δ_ins_d2_researcher_extra_alias; 

FOR temprecΔ_del_d2_researcher IN ( SELECT * FROM Δ_del_d2_researcher) LOOP 
            DELETE FROM public.d2_researcher WHERE ROW(MEDICATIONNAME,MECHANISMOFACTION,MODEOFACTION,SHAREDWITHDOCTORORNOT) IS NOT DISTINCT FROM  temprecΔ_del_d2_researcher;
            END LOOP;
DROP TABLE Δ_del_d2_researcher;

INSERT INTO public.d2_researcher SELECT * FROM  Δ_ins_d2_researcher; 
DROP TABLE Δ_ins_d2_researcher;
    END IF;
    RETURN NULL;
  EXCEPTION
    WHEN object_not_in_prerequisite_state THEN
        RAISE object_not_in_prerequisite_state USING MESSAGE = 'no permission to insert or delete or update to source relations of public.d23_researanddoc';
    WHEN OTHERS THEN
        GET STACKED DIAGNOSTICS text_var1 = RETURNED_SQLSTATE,
                                text_var2 = PG_EXCEPTION_DETAIL,
                                text_var3 = MESSAGE_TEXT;
        RAISE SQLSTATE 'DA000' USING MESSAGE = 'error on the trigger of public.d23_researanddoc ; error code: ' || text_var1 || ' ; ' || text_var2 ||' ; ' || text_var3;
        RETURN NULL;
  END;
$$;

CREATE OR REPLACE FUNCTION public.d23_researanddoc_materialization()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
  DECLARE
  text_var1 text;
  text_var2 text;
  text_var3 text;
  BEGIN
    IF NOT EXISTS (SELECT * FROM information_schema.tables WHERE table_name = '__temp__Δ_ins_d23_researanddoc' OR table_name = '__temp__Δ_del_d23_researanddoc')
    THEN
        -- RAISE NOTICE 'execute procedure d23_researanddoc_materialization';
        REFRESH MATERIALIZED VIEW public.__dummy__materialized_d23_researanddoc;
        CREATE TEMPORARY TABLE __temp__Δ_ins_d23_researanddoc ( LIKE public.__dummy__materialized_d23_researanddoc INCLUDING ALL ) WITH OIDS ON COMMIT DROP;
        CREATE CONSTRAINT TRIGGER __temp__d23_researanddoc_trigger_delta_action
        AFTER INSERT OR UPDATE OR DELETE ON 
            __temp__Δ_ins_d23_researanddoc DEFERRABLE INITIALLY DEFERRED 
            FOR EACH ROW EXECUTE PROCEDURE public.d23_researanddoc_delta_action();

        CREATE TEMPORARY TABLE __temp__Δ_del_d23_researanddoc ( LIKE public.__dummy__materialized_d23_researanddoc INCLUDING ALL ) WITH OIDS ON COMMIT DROP;
        CREATE CONSTRAINT TRIGGER __temp__d23_researanddoc_trigger_delta_action
        AFTER INSERT OR UPDATE OR DELETE ON 
            __temp__Δ_del_d23_researanddoc DEFERRABLE INITIALLY DEFERRED 
            FOR EACH ROW EXECUTE PROCEDURE public.d23_researanddoc_delta_action();
    END IF;
    RETURN NULL;
  EXCEPTION
    WHEN object_not_in_prerequisite_state THEN
        RAISE object_not_in_prerequisite_state USING MESSAGE = 'no permission to insert or delete or update to source relations of public.d23_researanddoc';
    WHEN OTHERS THEN
        GET STACKED DIAGNOSTICS text_var1 = RETURNED_SQLSTATE,
                                text_var2 = PG_EXCEPTION_DETAIL,
                                text_var3 = MESSAGE_TEXT;
        RAISE SQLSTATE 'DA000' USING MESSAGE = 'error on the trigger of public.d23_researanddoc ; error code: ' || text_var1 || ' ; ' || text_var2 ||' ; ' || text_var3;
        RETURN NULL;
  END;
$$;

DROP TRIGGER IF EXISTS d23_researanddoc_trigger_materialization ON public.d23_researanddoc;
CREATE TRIGGER d23_researanddoc_trigger_materialization
    BEFORE INSERT OR UPDATE OR DELETE ON
      public.d23_researanddoc FOR EACH STATEMENT EXECUTE PROCEDURE public.d23_researanddoc_materialization();

CREATE OR REPLACE FUNCTION public.d23_researanddoc_update()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
  DECLARE
  text_var1 text;
  text_var2 text;
  text_var3 text;
  BEGIN
    -- RAISE NOTICE 'execute procedure d23_researanddoc_update';
    IF TG_OP = 'INSERT' THEN
      -- raise notice 'NEW: %', NEW;
      DELETE FROM __temp__Δ_del_d23_researanddoc WHERE ROW(MEDICATIONNAME,MECHANISMOFACTION) IS NOT DISTINCT FROM NEW;
      INSERT INTO __temp__Δ_ins_d23_researanddoc SELECT (NEW).*; 
    ELSIF TG_OP = 'UPDATE' THEN
      DELETE FROM __temp__Δ_ins_d23_researanddoc WHERE ROW(MEDICATIONNAME,MECHANISMOFACTION) IS NOT DISTINCT FROM OLD;
      INSERT INTO __temp__Δ_del_d23_researanddoc SELECT (OLD).*;
      DELETE FROM __temp__Δ_del_d23_researanddoc WHERE ROW(MEDICATIONNAME,MECHANISMOFACTION) IS NOT DISTINCT FROM NEW;
      INSERT INTO __temp__Δ_ins_d23_researanddoc SELECT (NEW).*; 
    ELSIF TG_OP = 'DELETE' THEN
      -- raise notice 'OLD: %', OLD;
      DELETE FROM __temp__Δ_ins_d23_researanddoc WHERE ROW(MEDICATIONNAME,MECHANISMOFACTION) IS NOT DISTINCT FROM OLD;
      INSERT INTO __temp__Δ_del_d23_researanddoc SELECT (OLD).*;
    END IF;
    RETURN NULL;
  EXCEPTION
    WHEN object_not_in_prerequisite_state THEN
        RAISE object_not_in_prerequisite_state USING MESSAGE = 'no permission to insert or delete or update to source relations of public.d23_researanddoc';
    WHEN OTHERS THEN
        GET STACKED DIAGNOSTICS text_var1 = RETURNED_SQLSTATE,
                                text_var2 = PG_EXCEPTION_DETAIL,
                                text_var3 = MESSAGE_TEXT;
        RAISE SQLSTATE 'DA000' USING MESSAGE = 'error on the trigger of public.d23_researanddoc ; error code: ' || text_var1 || ' ; ' || text_var2 ||' ; ' || text_var3;
        RETURN NULL;
  END;
$$;

DROP TRIGGER IF EXISTS d23_researanddoc_trigger_update ON public.d23_researanddoc;
CREATE TRIGGER d23_researanddoc_trigger_update
    INSTEAD OF INSERT OR UPDATE OR DELETE ON
      public.d23_researanddoc FOR EACH ROW EXECUTE PROCEDURE public.d23_researanddoc_update();

