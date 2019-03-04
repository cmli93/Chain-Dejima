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

theorem disjoint_deltas {d32_doctandresear: string → string → Prop} {d3_doctor: ℤ → string → string → string → string → Prop}: true → (∃ COL0 COL1 COL2 COL3 COL4, ((d32_doctandresear COL1 COL3 ∧ (∃ MECHANISMOFACTION, d3_doctor COL0 COL1 COL2 MECHANISMOFACTION COL4)) ∧ ¬(∃ PATIENTID CLINICALDATA DOSAGE, d3_doctor PATIENTID COL1 CLINICALDATA COL3 DOSAGE)) ∧ d3_doctor COL0 COL1 COL2 COL3 COL4 ∧ ¬d32_doctandresear COL1 COL3) → false:= 
    begin
    intro h,
    try{rw[imp_false] at *},
    try{simp at *},
    revert h,
    z3_smt,
    end

theorem getput {d3_doctor: ℤ → string → string → string → string → Prop}: true → (∃ COL0 COL1 COL2 COL3 COL4, d3_doctor COL0 COL1 COL2 COL3 COL4 ∧ ¬(∃ PATIENTID CLINICALDATA DOSAGE, d3_doctor PATIENTID COL1 CLINICALDATA COL3 DOSAGE)) ∨ (∃ COL0 COL1 COL2 COL3 COL4, ((∃ PATIENTID CLINICALDATA DOSAGE, d3_doctor PATIENTID COL1 CLINICALDATA COL3 DOSAGE) ∧ (∃ MECHANISMOFACTION, d3_doctor COL0 COL1 COL2 MECHANISMOFACTION COL4)) ∧ ¬(∃ PATIENTID CLINICALDATA DOSAGE, d3_doctor PATIENTID COL1 CLINICALDATA COL3 DOSAGE)) → false:= 
    begin
    intro h,
    try{rw[imp_false] at *},
    try{simp at *},
    revert h,
    z3_smt,
    end

theorem putget {d32_doctandresear: string → string → Prop} {d3_doctor: ℤ → string → string → string → string → Prop}: true → (∀ MECHANISMOFACTION MEDICATIONNAME, (∃ COL0' COL2 COL4, d3_doctor COL0' MEDICATIONNAME COL2 MECHANISMOFACTION COL4 ∧ ¬(d3_doctor COL0' MEDICATIONNAME COL2 MECHANISMOFACTION COL4 ∧ ¬d32_doctandresear MEDICATIONNAME MECHANISMOFACTION) ∨ (d32_doctandresear MEDICATIONNAME MECHANISMOFACTION ∧ (∃ MECHANISMOFACTION, d3_doctor COL0' MEDICATIONNAME COL2 MECHANISMOFACTION COL4)) ∧ ¬(∃ PATIENTID CLINICALDATA DOSAGE, d3_doctor PATIENTID MEDICATIONNAME CLINICALDATA MECHANISMOFACTION DOSAGE)) ↔ d32_doctandresear MEDICATIONNAME MECHANISMOFACTION):= 
    begin
    intro h,
    try{rw[imp_false] at *},
    try{simp at *},
    revert h,
    z3_smt,
    end
