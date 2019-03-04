import logic.basic
import tactic.basic
import tactic.finish
import tactic.interactive
import bx
import super
import smt2
universe u
open int
open auto

local attribute [instance] classical.prop_decidable -- make all prop decidable

theorem disjoint_deltas {d31_doctandpati: ℤ → string → string → string → Prop} {d3_doctor: ℤ → string → string → string → string → Prop}: true → (∃ COL0 COL1 COL2 COL3 COL4, (((d31_doctandpati COL0 COL1 COL2 COL4 ∧ (∃ CLINICALDATA DOSAGE, d3_doctor COL0 COL1 CLINICALDATA COL3 DOSAGE)) ∧ ¬(∃ MEDICATIONNAME MECHANISMOFACTION, d3_doctor COL0 MEDICATIONNAME COL2 MECHANISMOFACTION COL4)) ∧ COL0 = (188:ℤ)) ∧ (d3_doctor COL0 COL1 COL2 COL3 COL4 ∧ ¬(∃ MEDICATIONNAME, d31_doctandpati COL0 MEDICATIONNAME COL2 COL4)) ∧ COL0 = (188:ℤ)) → false:= 
    begin
    intro h,
    try{rw[imp_false] at *},
    try{simp at *},
    revert h,
    z3_smt,
    end

theorem getput {d3_doctor: ℤ → string → string → string → string → Prop}: true → (∃ COL0 COL1 COL2 COL3 COL4, (d3_doctor COL0 COL1 COL2 COL3 COL4 ∧ ¬(∃ COL1, (∃ MECHANISMOFACTION, d3_doctor COL0 COL1 COL2 MECHANISMOFACTION COL4) ∧ COL0 = (188:ℤ))) ∧ COL0 = (188:ℤ)) ∨ (∃ COL0 COL1 COL2 COL3 COL4, ((((∃ MECHANISMOFACTION, d3_doctor COL0 COL1 COL2 MECHANISMOFACTION COL4) ∧ COL0 = (188:ℤ)) ∧ (∃ CLINICALDATA DOSAGE, d3_doctor COL0 COL1 CLINICALDATA COL3 DOSAGE)) ∧ ¬(∃ MEDICATIONNAME MECHANISMOFACTION, d3_doctor COL0 MEDICATIONNAME COL2 MECHANISMOFACTION COL4)) ∧ COL0 = (188:ℤ)) → false:= 
    begin
    intro h,
    try{rw[imp_false] at *},
    try{simp at *},
    revert h,
    z3_smt,
    end

theorem putget {d31_doctandpati: ℤ → string → string → string → Prop} {d3_doctor: ℤ → string → string → string → string → Prop}: true → (∀ CLINICALDATA DOSAGE MEDICATIONNAME PATIENTID, (∃ COL3', d3_doctor PATIENTID MEDICATIONNAME CLINICALDATA COL3' DOSAGE ∧ ¬((d3_doctor PATIENTID MEDICATIONNAME CLINICALDATA COL3' DOSAGE ∧ ¬(∃ MEDICATIONNAME, d31_doctandpati PATIENTID MEDICATIONNAME CLINICALDATA DOSAGE)) ∧ PATIENTID = (188:ℤ)) ∨ ((d31_doctandpati PATIENTID MEDICATIONNAME CLINICALDATA DOSAGE ∧ (∃ CLINICALDATA DOSAGE, d3_doctor PATIENTID MEDICATIONNAME CLINICALDATA COL3' DOSAGE)) ∧ ¬(∃ MEDICATIONNAME MECHANISMOFACTION, d3_doctor PATIENTID MEDICATIONNAME CLINICALDATA MECHANISMOFACTION DOSAGE)) ∧ PATIENTID = (188:ℤ)) ∧ PATIENTID = (188:ℤ) ↔ d31_doctandpati PATIENTID MEDICATIONNAME CLINICALDATA DOSAGE):= 
    begin
    intro h,
    try{rw[imp_false] at *},
    try{simp at *},
    revert h,
    z3_smt,
    end
