CREATE OR REPLACE VIEW public.d31_doctandpati AS 
SELECT __dummy__.COL0 AS PATIENTID,__dummy__.COL1 AS MEDICATIONNAME,__dummy__.COL2 AS CLINICALDATA,__dummy__.COL3 AS DOSAGE 
FROM (SELECT DISTINCT d31_doctandpati_a4_0.COL0 AS COL0, d31_doctandpati_a4_0.COL1 AS COL1, d31_doctandpati_a4_0.COL2 AS COL2, d31_doctandpati_a4_0.COL3 AS COL3 
FROM (SELECT DISTINCT d3_doctor_a5_0.PATIENTID AS COL0, d3_doctor_a5_0.MEDICATIONNAME AS COL1, d3_doctor_a5_0.CLINICALDATA AS COL2, d3_doctor_a5_0.DOSAGE AS COL3 
FROM public.d3_doctor AS d3_doctor_a5_0 
WHERE d3_doctor_a5_0.PATIENTID = 188 ) AS d31_doctandpati_a4_0  ) AS __dummy__;

DROP MATERIALIZED VIEW IF EXISTS public.__dummy__materialized_d31_doctandpati;

CREATE  MATERIALIZED VIEW public.__dummy__materialized_d31_doctandpati AS 
SELECT * FROM public.d31_doctandpati;

CREATE OR REPLACE FUNCTION public.d31_doctandpati_delta_action()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
  DECLARE
  text_var1 text;
  text_var2 text;
  text_var3 text;
  temprecΔ_del_d3_doctor public.d3_doctor%ROWTYPE;
temprecΔ_ins_d3_doctor public.d3_doctor%ROWTYPE;
  BEGIN
    IF NOT EXISTS (SELECT * FROM information_schema.tables WHERE table_name = 'd31_doctandpati_delta_action_flag') THEN
        -- RAISE NOTICE 'execute procedure d31_doctandpati_delta_action';
        CREATE TEMPORARY TABLE d31_doctandpati_delta_action_flag ON COMMIT DROP AS (SELECT true as finish);
        IF EXISTS (SELECT WHERE false )
        THEN 
          RAISE check_violation USING MESSAGE = 'Invalid update on view';
        END IF;
        CREATE TEMPORARY TABLE Δ_del_d3_doctor WITH OIDS ON COMMIT DROP AS SELECT (ROW(COL0,COL1,COL2,COL3,COL4) :: public.d3_doctor).* 
            FROM (SELECT DISTINCT Δ_del_d3_doctor_a5_0.COL0 AS COL0, Δ_del_d3_doctor_a5_0.COL1 AS COL1, Δ_del_d3_doctor_a5_0.COL2 AS COL2, Δ_del_d3_doctor_a5_0.COL3 AS COL3, Δ_del_d3_doctor_a5_0.COL4 AS COL4 
FROM (SELECT DISTINCT d3_doctor_a5_0.PATIENTID AS COL0, d3_doctor_a5_0.MEDICATIONNAME AS COL1, d3_doctor_a5_0.CLINICALDATA AS COL2, d3_doctor_a5_0.MECHANISMOFACTION AS COL3, d3_doctor_a5_0.DOSAGE AS COL4 
FROM public.d3_doctor AS d3_doctor_a5_0 
WHERE d3_doctor_a5_0.PATIENTID = 188 AND NOT EXISTS ( SELECT * 
FROM (SELECT DISTINCT __dummy__materialized_d31_doctandpati_a4_0.PATIENTID AS COL0, __dummy__materialized_d31_doctandpati_a4_0.MEDICATIONNAME AS COL1, __dummy__materialized_d31_doctandpati_a4_0.CLINICALDATA AS COL2, __dummy__materialized_d31_doctandpati_a4_0.DOSAGE AS COL3 
FROM public.__dummy__materialized_d31_doctandpati AS __dummy__materialized_d31_doctandpati_a4_0 
WHERE NOT EXISTS ( SELECT * 
FROM __temp__Δ_del_d31_doctandpati AS __temp__Δ_del_d31_doctandpati_a4 
WHERE __temp__Δ_del_d31_doctandpati_a4.DOSAGE IS NOT DISTINCT FROM __dummy__materialized_d31_doctandpati_a4_0.DOSAGE AND __temp__Δ_del_d31_doctandpati_a4.CLINICALDATA IS NOT DISTINCT FROM __dummy__materialized_d31_doctandpati_a4_0.CLINICALDATA AND __temp__Δ_del_d31_doctandpati_a4.MEDICATIONNAME IS NOT DISTINCT FROM __dummy__materialized_d31_doctandpati_a4_0.MEDICATIONNAME AND __temp__Δ_del_d31_doctandpati_a4.PATIENTID IS NOT DISTINCT FROM __dummy__materialized_d31_doctandpati_a4_0.PATIENTID )  UNION SELECT DISTINCT __temp__Δ_ins_d31_doctandpati_a4_0.PATIENTID AS COL0, __temp__Δ_ins_d31_doctandpati_a4_0.MEDICATIONNAME AS COL1, __temp__Δ_ins_d31_doctandpati_a4_0.CLINICALDATA AS COL2, __temp__Δ_ins_d31_doctandpati_a4_0.DOSAGE AS COL3 
FROM __temp__Δ_ins_d31_doctandpati AS __temp__Δ_ins_d31_doctandpati_a4_0  ) AS d31_doctandpati_a4 
WHERE d31_doctandpati_a4.COL3 IS NOT DISTINCT FROM d3_doctor_a5_0.DOSAGE AND d31_doctandpati_a4.COL2 IS NOT DISTINCT FROM d3_doctor_a5_0.CLINICALDATA AND d31_doctandpati_a4.COL0 IS NOT DISTINCT FROM d3_doctor_a5_0.PATIENTID ) ) AS Δ_del_d3_doctor_a5_0  ) AS Δ_del_d3_doctor_extra_alias;

CREATE TEMPORARY TABLE Δ_ins_d3_doctor WITH OIDS ON COMMIT DROP AS SELECT (ROW(COL0,COL1,COL2,COL3,COL4) :: public.d3_doctor).* 
            FROM (SELECT DISTINCT Δ_ins_d3_doctor_a5_0.COL0 AS COL0, Δ_ins_d3_doctor_a5_0.COL1 AS COL1, Δ_ins_d3_doctor_a5_0.COL2 AS COL2, Δ_ins_d3_doctor_a5_0.COL3 AS COL3, Δ_ins_d3_doctor_a5_0.COL4 AS COL4 
FROM (SELECT DISTINCT d3_doctor_a5_1.PATIENTID AS COL0, d3_doctor_a5_1.MEDICATIONNAME AS COL1, d31_doctandpati_a4_0.COL2 AS COL2, d3_doctor_a5_1.MECHANISMOFACTION AS COL3, d31_doctandpati_a4_0.COL3 AS COL4 
FROM (SELECT DISTINCT __dummy__materialized_d31_doctandpati_a4_0.PATIENTID AS COL0, __dummy__materialized_d31_doctandpati_a4_0.MEDICATIONNAME AS COL1, __dummy__materialized_d31_doctandpati_a4_0.CLINICALDATA AS COL2, __dummy__materialized_d31_doctandpati_a4_0.DOSAGE AS COL3 
FROM public.__dummy__materialized_d31_doctandpati AS __dummy__materialized_d31_doctandpati_a4_0 
WHERE NOT EXISTS ( SELECT * 
FROM __temp__Δ_del_d31_doctandpati AS __temp__Δ_del_d31_doctandpati_a4 
WHERE __temp__Δ_del_d31_doctandpati_a4.DOSAGE IS NOT DISTINCT FROM __dummy__materialized_d31_doctandpati_a4_0.DOSAGE AND __temp__Δ_del_d31_doctandpati_a4.CLINICALDATA IS NOT DISTINCT FROM __dummy__materialized_d31_doctandpati_a4_0.CLINICALDATA AND __temp__Δ_del_d31_doctandpati_a4.MEDICATIONNAME IS NOT DISTINCT FROM __dummy__materialized_d31_doctandpati_a4_0.MEDICATIONNAME AND __temp__Δ_del_d31_doctandpati_a4.PATIENTID IS NOT DISTINCT FROM __dummy__materialized_d31_doctandpati_a4_0.PATIENTID )  UNION SELECT DISTINCT __temp__Δ_ins_d31_doctandpati_a4_0.PATIENTID AS COL0, __temp__Δ_ins_d31_doctandpati_a4_0.MEDICATIONNAME AS COL1, __temp__Δ_ins_d31_doctandpati_a4_0.CLINICALDATA AS COL2, __temp__Δ_ins_d31_doctandpati_a4_0.DOSAGE AS COL3 
FROM __temp__Δ_ins_d31_doctandpati AS __temp__Δ_ins_d31_doctandpati_a4_0  ) AS d31_doctandpati_a4_0, public.d3_doctor AS d3_doctor_a5_1 
WHERE d3_doctor_a5_1.MEDICATIONNAME = d31_doctandpati_a4_0.COL1 AND d3_doctor_a5_1.PATIENTID = d31_doctandpati_a4_0.COL0 AND d3_doctor_a5_1.PATIENTID = 188 AND NOT EXISTS ( SELECT * 
FROM public.d3_doctor AS d3_doctor_a5 
WHERE d3_doctor_a5.DOSAGE IS NOT DISTINCT FROM d31_doctandpati_a4_0.COL3 AND d3_doctor_a5.CLINICALDATA IS NOT DISTINCT FROM d31_doctandpati_a4_0.COL2 AND d3_doctor_a5.PATIENTID IS NOT DISTINCT FROM d3_doctor_a5_1.PATIENTID ) ) AS Δ_ins_d3_doctor_a5_0  ) AS Δ_ins_d3_doctor_extra_alias; 

FOR temprecΔ_del_d3_doctor IN ( SELECT * FROM Δ_del_d3_doctor) LOOP 
            DELETE FROM public.d3_doctor WHERE ROW(PATIENTID,MEDICATIONNAME,CLINICALDATA,MECHANISMOFACTION,DOSAGE) IS NOT DISTINCT FROM  temprecΔ_del_d3_doctor;
            END LOOP;
DROP TABLE Δ_del_d3_doctor;

INSERT INTO public.d3_doctor SELECT * FROM  Δ_ins_d3_doctor; 
DROP TABLE Δ_ins_d3_doctor;
    END IF;
    RETURN NULL;
  EXCEPTION
    WHEN object_not_in_prerequisite_state THEN
        RAISE object_not_in_prerequisite_state USING MESSAGE = 'no permission to insert or delete or update to source relations of public.d31_doctandpati';
    WHEN OTHERS THEN
        GET STACKED DIAGNOSTICS text_var1 = RETURNED_SQLSTATE,
                                text_var2 = PG_EXCEPTION_DETAIL,
                                text_var3 = MESSAGE_TEXT;
        RAISE SQLSTATE 'DA000' USING MESSAGE = 'error on the trigger of public.d31_doctandpati ; error code: ' || text_var1 || ' ; ' || text_var2 ||' ; ' || text_var3;
        RETURN NULL;
  END;
$$;

CREATE OR REPLACE FUNCTION public.d31_doctandpati_materialization()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
  DECLARE
  text_var1 text;
  text_var2 text;
  text_var3 text;
  BEGIN
    IF NOT EXISTS (SELECT * FROM information_schema.tables WHERE table_name = '__temp__Δ_ins_d31_doctandpati' OR table_name = '__temp__Δ_del_d31_doctandpati')
    THEN
        -- RAISE NOTICE 'execute procedure d31_doctandpati_materialization';
        REFRESH MATERIALIZED VIEW public.__dummy__materialized_d31_doctandpati;
        CREATE TEMPORARY TABLE __temp__Δ_ins_d31_doctandpati ( LIKE public.__dummy__materialized_d31_doctandpati INCLUDING ALL ) WITH OIDS ON COMMIT DROP;
        CREATE CONSTRAINT TRIGGER __temp__d31_doctandpati_trigger_delta_action
        AFTER INSERT OR UPDATE OR DELETE ON 
            __temp__Δ_ins_d31_doctandpati DEFERRABLE INITIALLY DEFERRED 
            FOR EACH ROW EXECUTE PROCEDURE public.d31_doctandpati_delta_action();

        CREATE TEMPORARY TABLE __temp__Δ_del_d31_doctandpati ( LIKE public.__dummy__materialized_d31_doctandpati INCLUDING ALL ) WITH OIDS ON COMMIT DROP;
        CREATE CONSTRAINT TRIGGER __temp__d31_doctandpati_trigger_delta_action
        AFTER INSERT OR UPDATE OR DELETE ON 
            __temp__Δ_del_d31_doctandpati DEFERRABLE INITIALLY DEFERRED 
            FOR EACH ROW EXECUTE PROCEDURE public.d31_doctandpati_delta_action();
    END IF;
    RETURN NULL;
  EXCEPTION
    WHEN object_not_in_prerequisite_state THEN
        RAISE object_not_in_prerequisite_state USING MESSAGE = 'no permission to insert or delete or update to source relations of public.d31_doctandpati';
    WHEN OTHERS THEN
        GET STACKED DIAGNOSTICS text_var1 = RETURNED_SQLSTATE,
                                text_var2 = PG_EXCEPTION_DETAIL,
                                text_var3 = MESSAGE_TEXT;
        RAISE SQLSTATE 'DA000' USING MESSAGE = 'error on the trigger of public.d31_doctandpati ; error code: ' || text_var1 || ' ; ' || text_var2 ||' ; ' || text_var3;
        RETURN NULL;
  END;
$$;

DROP TRIGGER IF EXISTS d31_doctandpati_trigger_materialization ON public.d31_doctandpati;
CREATE TRIGGER d31_doctandpati_trigger_materialization
    BEFORE INSERT OR UPDATE OR DELETE ON
      public.d31_doctandpati FOR EACH STATEMENT EXECUTE PROCEDURE public.d31_doctandpati_materialization();

CREATE OR REPLACE FUNCTION public.d31_doctandpati_update()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
  DECLARE
  text_var1 text;
  text_var2 text;
  text_var3 text;
  BEGIN
    -- RAISE NOTICE 'execute procedure d31_doctandpati_update';
    IF TG_OP = 'INSERT' THEN
      -- raise notice 'NEW: %', NEW;
      DELETE FROM __temp__Δ_del_d31_doctandpati WHERE ROW(PATIENTID,MEDICATIONNAME,CLINICALDATA,DOSAGE) IS NOT DISTINCT FROM NEW;
      INSERT INTO __temp__Δ_ins_d31_doctandpati SELECT (NEW).*; 
    ELSIF TG_OP = 'UPDATE' THEN
      DELETE FROM __temp__Δ_ins_d31_doctandpati WHERE ROW(PATIENTID,MEDICATIONNAME,CLINICALDATA,DOSAGE) IS NOT DISTINCT FROM OLD;
      INSERT INTO __temp__Δ_del_d31_doctandpati SELECT (OLD).*;
      DELETE FROM __temp__Δ_del_d31_doctandpati WHERE ROW(PATIENTID,MEDICATIONNAME,CLINICALDATA,DOSAGE) IS NOT DISTINCT FROM NEW;
      INSERT INTO __temp__Δ_ins_d31_doctandpati SELECT (NEW).*; 
    ELSIF TG_OP = 'DELETE' THEN
      -- raise notice 'OLD: %', OLD;
      DELETE FROM __temp__Δ_ins_d31_doctandpati WHERE ROW(PATIENTID,MEDICATIONNAME,CLINICALDATA,DOSAGE) IS NOT DISTINCT FROM OLD;
      INSERT INTO __temp__Δ_del_d31_doctandpati SELECT (OLD).*;
    END IF;
    RETURN NULL;
  EXCEPTION
    WHEN object_not_in_prerequisite_state THEN
        RAISE object_not_in_prerequisite_state USING MESSAGE = 'no permission to insert or delete or update to source relations of public.d31_doctandpati';
    WHEN OTHERS THEN
        GET STACKED DIAGNOSTICS text_var1 = RETURNED_SQLSTATE,
                                text_var2 = PG_EXCEPTION_DETAIL,
                                text_var3 = MESSAGE_TEXT;
        RAISE SQLSTATE 'DA000' USING MESSAGE = 'error on the trigger of public.d31_doctandpati ; error code: ' || text_var1 || ' ; ' || text_var2 ||' ; ' || text_var3;
        RETURN NULL;
  END;
$$;

DROP TRIGGER IF EXISTS d31_doctandpati_trigger_update ON public.d31_doctandpati;
CREATE TRIGGER d31_doctandpati_trigger_update
    INSTEAD OF INSERT OR UPDATE OR DELETE ON
      public.d31_doctandpati FOR EACH ROW EXECUTE PROCEDURE public.d31_doctandpati_update();

