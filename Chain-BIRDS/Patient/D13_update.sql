CREATE OR REPLACE VIEW public.d13_patianddoct AS 
SELECT __dummy__.COL0 AS PATIENTID,__dummy__.COL1 AS MEDICATIONNAME,__dummy__.COL2 AS CLINICALDATA,__dummy__.COL3 AS DOSAGE 
FROM (SELECT DISTINCT d13_patianddoct_a4_0.COL0 AS COL0, d13_patianddoct_a4_0.COL1 AS COL1, d13_patianddoct_a4_0.COL2 AS COL2, d13_patianddoct_a4_0.COL3 AS COL3 
FROM (SELECT DISTINCT d1_patient_a5_0.PATIENTID AS COL0, d1_patient_a5_0.MEDICATIONNAME AS COL1, d1_patient_a5_0.CLINICALDATA AS COL2, d1_patient_a5_0.DOSAGE AS COL3 
FROM public.d1_patient AS d1_patient_a5_0  ) AS d13_patianddoct_a4_0  ) AS __dummy__;

DROP MATERIALIZED VIEW IF EXISTS public.__dummy__materialized_d13_patianddoct;

CREATE  MATERIALIZED VIEW public.__dummy__materialized_d13_patianddoct AS 
SELECT * FROM public.d13_patianddoct;

CREATE OR REPLACE FUNCTION public.d13_patianddoct_delta_action()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
  DECLARE
  text_var1 text;
  text_var2 text;
  text_var3 text;
  temprecΔ_del_d1_patient public.d1_patient%ROWTYPE;
temprecΔ_ins_d1_patient public.d1_patient%ROWTYPE;
  BEGIN
    IF NOT EXISTS (SELECT * FROM information_schema.tables WHERE table_name = 'd13_patianddoct_delta_action_flag') THEN
        -- RAISE NOTICE 'execute procedure d13_patianddoct_delta_action';
        CREATE TEMPORARY TABLE d13_patianddoct_delta_action_flag ON COMMIT DROP AS (SELECT true as finish);
        IF EXISTS (SELECT WHERE false )
        THEN 
          RAISE check_violation USING MESSAGE = 'Invalid update on view';
        END IF;
        CREATE TEMPORARY TABLE Δ_del_d1_patient WITH OIDS ON COMMIT DROP AS SELECT (ROW(COL0,COL1,COL2,COL3,COL4) :: public.d1_patient).* 
            FROM (SELECT DISTINCT Δ_del_d1_patient_a5_0.COL0 AS COL0, Δ_del_d1_patient_a5_0.COL1 AS COL1, Δ_del_d1_patient_a5_0.COL2 AS COL2, Δ_del_d1_patient_a5_0.COL3 AS COL3, Δ_del_d1_patient_a5_0.COL4 AS COL4 
FROM (SELECT DISTINCT d1_patient_a5_0.PATIENTID AS COL0, d1_patient_a5_0.MEDICATIONNAME AS COL1, d1_patient_a5_0.CLINICALDATA AS COL2, d1_patient_a5_0.ADDRESS AS COL3, d1_patient_a5_0.DOSAGE AS COL4 
FROM public.d1_patient AS d1_patient_a5_0 
WHERE NOT EXISTS ( SELECT * 
FROM (SELECT DISTINCT __dummy__materialized_d13_patianddoct_a4_0.PATIENTID AS COL0, __dummy__materialized_d13_patianddoct_a4_0.MEDICATIONNAME AS COL1, __dummy__materialized_d13_patianddoct_a4_0.CLINICALDATA AS COL2, __dummy__materialized_d13_patianddoct_a4_0.DOSAGE AS COL3 
FROM public.__dummy__materialized_d13_patianddoct AS __dummy__materialized_d13_patianddoct_a4_0 
WHERE NOT EXISTS ( SELECT * 
FROM __temp__Δ_del_d13_patianddoct AS __temp__Δ_del_d13_patianddoct_a4 
WHERE __temp__Δ_del_d13_patianddoct_a4.DOSAGE IS NOT DISTINCT FROM __dummy__materialized_d13_patianddoct_a4_0.DOSAGE AND __temp__Δ_del_d13_patianddoct_a4.CLINICALDATA IS NOT DISTINCT FROM __dummy__materialized_d13_patianddoct_a4_0.CLINICALDATA AND __temp__Δ_del_d13_patianddoct_a4.MEDICATIONNAME IS NOT DISTINCT FROM __dummy__materialized_d13_patianddoct_a4_0.MEDICATIONNAME AND __temp__Δ_del_d13_patianddoct_a4.PATIENTID IS NOT DISTINCT FROM __dummy__materialized_d13_patianddoct_a4_0.PATIENTID )  UNION SELECT DISTINCT __temp__Δ_ins_d13_patianddoct_a4_0.PATIENTID AS COL0, __temp__Δ_ins_d13_patianddoct_a4_0.MEDICATIONNAME AS COL1, __temp__Δ_ins_d13_patianddoct_a4_0.CLINICALDATA AS COL2, __temp__Δ_ins_d13_patianddoct_a4_0.DOSAGE AS COL3 
FROM __temp__Δ_ins_d13_patianddoct AS __temp__Δ_ins_d13_patianddoct_a4_0  ) AS d13_patianddoct_a4 
WHERE d13_patianddoct_a4.COL3 IS NOT DISTINCT FROM d1_patient_a5_0.DOSAGE AND d13_patianddoct_a4.COL2 IS NOT DISTINCT FROM d1_patient_a5_0.CLINICALDATA AND d13_patianddoct_a4.COL1 IS NOT DISTINCT FROM d1_patient_a5_0.MEDICATIONNAME AND d13_patianddoct_a4.COL0 IS NOT DISTINCT FROM d1_patient_a5_0.PATIENTID ) ) AS Δ_del_d1_patient_a5_0  ) AS Δ_del_d1_patient_extra_alias;

CREATE TEMPORARY TABLE Δ_ins_d1_patient WITH OIDS ON COMMIT DROP AS SELECT (ROW(COL0,COL1,COL2,COL3,COL4) :: public.d1_patient).* 
            FROM (SELECT DISTINCT Δ_ins_d1_patient_a5_0.COL0 AS COL0, Δ_ins_d1_patient_a5_0.COL1 AS COL1, Δ_ins_d1_patient_a5_0.COL2 AS COL2, Δ_ins_d1_patient_a5_0.COL3 AS COL3, Δ_ins_d1_patient_a5_0.COL4 AS COL4 
FROM (SELECT DISTINCT d1_patient_a5_1.PATIENTID AS COL0, d13_patianddoct_a4_0.COL1 AS COL1, d13_patianddoct_a4_0.COL2 AS COL2, d1_patient_a5_1.ADDRESS AS COL3, d13_patianddoct_a4_0.COL3 AS COL4 
FROM (SELECT DISTINCT __dummy__materialized_d13_patianddoct_a4_0.PATIENTID AS COL0, __dummy__materialized_d13_patianddoct_a4_0.MEDICATIONNAME AS COL1, __dummy__materialized_d13_patianddoct_a4_0.CLINICALDATA AS COL2, __dummy__materialized_d13_patianddoct_a4_0.DOSAGE AS COL3 
FROM public.__dummy__materialized_d13_patianddoct AS __dummy__materialized_d13_patianddoct_a4_0 
WHERE NOT EXISTS ( SELECT * 
FROM __temp__Δ_del_d13_patianddoct AS __temp__Δ_del_d13_patianddoct_a4 
WHERE __temp__Δ_del_d13_patianddoct_a4.DOSAGE IS NOT DISTINCT FROM __dummy__materialized_d13_patianddoct_a4_0.DOSAGE AND __temp__Δ_del_d13_patianddoct_a4.CLINICALDATA IS NOT DISTINCT FROM __dummy__materialized_d13_patianddoct_a4_0.CLINICALDATA AND __temp__Δ_del_d13_patianddoct_a4.MEDICATIONNAME IS NOT DISTINCT FROM __dummy__materialized_d13_patianddoct_a4_0.MEDICATIONNAME AND __temp__Δ_del_d13_patianddoct_a4.PATIENTID IS NOT DISTINCT FROM __dummy__materialized_d13_patianddoct_a4_0.PATIENTID )  UNION SELECT DISTINCT __temp__Δ_ins_d13_patianddoct_a4_0.PATIENTID AS COL0, __temp__Δ_ins_d13_patianddoct_a4_0.MEDICATIONNAME AS COL1, __temp__Δ_ins_d13_patianddoct_a4_0.CLINICALDATA AS COL2, __temp__Δ_ins_d13_patianddoct_a4_0.DOSAGE AS COL3 
FROM __temp__Δ_ins_d13_patianddoct AS __temp__Δ_ins_d13_patianddoct_a4_0  ) AS d13_patianddoct_a4_0, public.d1_patient AS d1_patient_a5_1 
WHERE d1_patient_a5_1.PATIENTID = d13_patianddoct_a4_0.COL0 AND NOT EXISTS ( SELECT * 
FROM public.d1_patient AS d1_patient_a5 
WHERE d1_patient_a5.DOSAGE IS NOT DISTINCT FROM d13_patianddoct_a4_0.COL3 AND d1_patient_a5.CLINICALDATA IS NOT DISTINCT FROM d13_patianddoct_a4_0.COL2 AND d1_patient_a5.MEDICATIONNAME IS NOT DISTINCT FROM d13_patianddoct_a4_0.COL1 AND d1_patient_a5.PATIENTID IS NOT DISTINCT FROM d1_patient_a5_1.PATIENTID ) ) AS Δ_ins_d1_patient_a5_0  ) AS Δ_ins_d1_patient_extra_alias; 

FOR temprecΔ_del_d1_patient IN ( SELECT * FROM Δ_del_d1_patient) LOOP 
            DELETE FROM public.d1_patient WHERE ROW(PATIENTID,MEDICATIONNAME,CLINICALDATA,ADDRESS,DOSAGE) IS NOT DISTINCT FROM  temprecΔ_del_d1_patient;
            END LOOP;
DROP TABLE Δ_del_d1_patient;

INSERT INTO public.d1_patient SELECT * FROM  Δ_ins_d1_patient; 
DROP TABLE Δ_ins_d1_patient;
    END IF;
    RETURN NULL;
  EXCEPTION
    WHEN object_not_in_prerequisite_state THEN
        RAISE object_not_in_prerequisite_state USING MESSAGE = 'no permission to insert or delete or update to source relations of public.d13_patianddoct';
    WHEN OTHERS THEN
        GET STACKED DIAGNOSTICS text_var1 = RETURNED_SQLSTATE,
                                text_var2 = PG_EXCEPTION_DETAIL,
                                text_var3 = MESSAGE_TEXT;
        RAISE SQLSTATE 'DA000' USING MESSAGE = 'error on the trigger of public.d13_patianddoct ; error code: ' || text_var1 || ' ; ' || text_var2 ||' ; ' || text_var3;
        RETURN NULL;
  END;
$$;

CREATE OR REPLACE FUNCTION public.d13_patianddoct_materialization()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
  DECLARE
  text_var1 text;
  text_var2 text;
  text_var3 text;
  BEGIN
    IF NOT EXISTS (SELECT * FROM information_schema.tables WHERE table_name = '__temp__Δ_ins_d13_patianddoct' OR table_name = '__temp__Δ_del_d13_patianddoct')
    THEN
        -- RAISE NOTICE 'execute procedure d13_patianddoct_materialization';
        REFRESH MATERIALIZED VIEW public.__dummy__materialized_d13_patianddoct;
        CREATE TEMPORARY TABLE __temp__Δ_ins_d13_patianddoct ( LIKE public.__dummy__materialized_d13_patianddoct INCLUDING ALL ) WITH OIDS ON COMMIT DROP;
        CREATE CONSTRAINT TRIGGER __temp__d13_patianddoct_trigger_delta_action
        AFTER INSERT OR UPDATE OR DELETE ON 
            __temp__Δ_ins_d13_patianddoct DEFERRABLE INITIALLY DEFERRED 
            FOR EACH ROW EXECUTE PROCEDURE public.d13_patianddoct_delta_action();

        CREATE TEMPORARY TABLE __temp__Δ_del_d13_patianddoct ( LIKE public.__dummy__materialized_d13_patianddoct INCLUDING ALL ) WITH OIDS ON COMMIT DROP;
        CREATE CONSTRAINT TRIGGER __temp__d13_patianddoct_trigger_delta_action
        AFTER INSERT OR UPDATE OR DELETE ON 
            __temp__Δ_del_d13_patianddoct DEFERRABLE INITIALLY DEFERRED 
            FOR EACH ROW EXECUTE PROCEDURE public.d13_patianddoct_delta_action();
    END IF;
    RETURN NULL;
  EXCEPTION
    WHEN object_not_in_prerequisite_state THEN
        RAISE object_not_in_prerequisite_state USING MESSAGE = 'no permission to insert or delete or update to source relations of public.d13_patianddoct';
    WHEN OTHERS THEN
        GET STACKED DIAGNOSTICS text_var1 = RETURNED_SQLSTATE,
                                text_var2 = PG_EXCEPTION_DETAIL,
                                text_var3 = MESSAGE_TEXT;
        RAISE SQLSTATE 'DA000' USING MESSAGE = 'error on the trigger of public.d13_patianddoct ; error code: ' || text_var1 || ' ; ' || text_var2 ||' ; ' || text_var3;
        RETURN NULL;
  END;
$$;

DROP TRIGGER IF EXISTS d13_patianddoct_trigger_materialization ON public.d13_patianddoct;
CREATE TRIGGER d13_patianddoct_trigger_materialization
    BEFORE INSERT OR UPDATE OR DELETE ON
      public.d13_patianddoct FOR EACH STATEMENT EXECUTE PROCEDURE public.d13_patianddoct_materialization();

CREATE OR REPLACE FUNCTION public.d13_patianddoct_update()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
  DECLARE
  text_var1 text;
  text_var2 text;
  text_var3 text;
  BEGIN
    -- RAISE NOTICE 'execute procedure d13_patianddoct_update';
    IF TG_OP = 'INSERT' THEN
      -- raise notice 'NEW: %', NEW;
      DELETE FROM __temp__Δ_del_d13_patianddoct WHERE ROW(PATIENTID,MEDICATIONNAME,CLINICALDATA,DOSAGE) IS NOT DISTINCT FROM NEW;
      INSERT INTO __temp__Δ_ins_d13_patianddoct SELECT (NEW).*; 
    ELSIF TG_OP = 'UPDATE' THEN
      DELETE FROM __temp__Δ_ins_d13_patianddoct WHERE ROW(PATIENTID,MEDICATIONNAME,CLINICALDATA,DOSAGE) IS NOT DISTINCT FROM OLD;
      INSERT INTO __temp__Δ_del_d13_patianddoct SELECT (OLD).*;
      DELETE FROM __temp__Δ_del_d13_patianddoct WHERE ROW(PATIENTID,MEDICATIONNAME,CLINICALDATA,DOSAGE) IS NOT DISTINCT FROM NEW;
      INSERT INTO __temp__Δ_ins_d13_patianddoct SELECT (NEW).*; 
    ELSIF TG_OP = 'DELETE' THEN
      -- raise notice 'OLD: %', OLD;
      DELETE FROM __temp__Δ_ins_d13_patianddoct WHERE ROW(PATIENTID,MEDICATIONNAME,CLINICALDATA,DOSAGE) IS NOT DISTINCT FROM OLD;
      INSERT INTO __temp__Δ_del_d13_patianddoct SELECT (OLD).*;
    END IF;
    RETURN NULL;
  EXCEPTION
    WHEN object_not_in_prerequisite_state THEN
        RAISE object_not_in_prerequisite_state USING MESSAGE = 'no permission to insert or delete or update to source relations of public.d13_patianddoct';
    WHEN OTHERS THEN
        GET STACKED DIAGNOSTICS text_var1 = RETURNED_SQLSTATE,
                                text_var2 = PG_EXCEPTION_DETAIL,
                                text_var3 = MESSAGE_TEXT;
        RAISE SQLSTATE 'DA000' USING MESSAGE = 'error on the trigger of public.d13_patianddoct ; error code: ' || text_var1 || ' ; ' || text_var2 ||' ; ' || text_var3;
        RETURN NULL;
  END;
$$;

DROP TRIGGER IF EXISTS d13_patianddoct_trigger_update ON public.d13_patianddoct;
CREATE TRIGGER d13_patianddoct_trigger_update
    INSTEAD OF INSERT OR UPDATE OR DELETE ON
      public.d13_patianddoct FOR EACH ROW EXECUTE PROCEDURE public.d13_patianddoct_update();

