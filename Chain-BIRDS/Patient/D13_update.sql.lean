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

theorem disjoint_deltas {d13_patianddoct: ℤ → string → string → string → Prop} {d1_patient: ℤ → string → string → string → string → Prop}: true → (∃ COL0 COL1 COL2 COL3 COL4, ((d13_patianddoct COL0 COL1 COL2 COL4 ∧ (∃ MEDICATIONNAME CLINICALDATA DOSAGE, d1_patient COL0 MEDICATIONNAME CLINICALDATA COL3 DOSAGE)) ∧ ¬(∃ ADDRESS, d1_patient COL0 COL1 COL2 ADDRESS COL4)) ∧ d1_patient COL0 COL1 COL2 COL3 COL4 ∧ ¬d13_patianddoct COL0 COL1 COL2 COL4) → false:= 
    begin
    intro h,
    try{rw[imp_false] at *},
    try{simp at *},
    revert h,
    z3_smt,
    end

theorem getput {d1_patient: ℤ → string → string → string → string → Prop}: true → (∃ COL0 COL1 COL2 COL3 COL4, d1_patient COL0 COL1 COL2 COL3 COL4 ∧ ¬(∃ ADDRESS, d1_patient COL0 COL1 COL2 ADDRESS COL4)) ∨ (∃ COL0 COL1 COL2 COL3 COL4, ((∃ ADDRESS, d1_patient COL0 COL1 COL2 ADDRESS COL4) ∧ (∃ MEDICATIONNAME CLINICALDATA DOSAGE, d1_patient COL0 MEDICATIONNAME CLINICALDATA COL3 DOSAGE)) ∧ ¬(∃ ADDRESS, d1_patient COL0 COL1 COL2 ADDRESS COL4)) → false:= 
    begin
    intro h,
    try{rw[imp_false] at *},
    try{simp at *},
    revert h,
    z3_smt,
    end

theorem putget {d13_patianddoct: ℤ → string → string → string → Prop} {d1_patient: ℤ → string → string → string → string → Prop}: true → (∀ CLINICALDATA DOSAGE MEDICATIONNAME PATIENTID, (∃ COL3', d1_patient PATIENTID MEDICATIONNAME CLINICALDATA COL3' DOSAGE ∧ ¬(d1_patient PATIENTID MEDICATIONNAME CLINICALDATA COL3' DOSAGE ∧ ¬d13_patianddoct PATIENTID MEDICATIONNAME CLINICALDATA DOSAGE) ∨ (d13_patianddoct PATIENTID MEDICATIONNAME CLINICALDATA DOSAGE ∧ (∃ MEDICATIONNAME CLINICALDATA DOSAGE, d1_patient PATIENTID MEDICATIONNAME CLINICALDATA COL3' DOSAGE)) ∧ ¬(∃ ADDRESS, d1_patient PATIENTID MEDICATIONNAME CLINICALDATA ADDRESS DOSAGE)) ↔ d13_patianddoct PATIENTID MEDICATIONNAME CLINICALDATA DOSAGE):= 
    begin
    intro h,
    try{rw[imp_false] at *},
    try{simp at *},
    revert h,
    z3_smt,
    end
