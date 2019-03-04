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

theorem disjoint_deltas {d23_researanddoc: string → string → Prop} {d2_researcher: string → string → string → string → Prop}: true → (∃ COL0 COL1 COL2 COL3, (((∃ MECHANISMOFACTION1, ((d2_researcher COL0 MECHANISMOFACTION1 COL2 COL3 ∧ d23_researanddoc COL0 COL1) ∧ COL3 = ('Yes':string)) ∧ MECHANISMOFACTION1 ≠ COL1) ∨ (∃ SHAREDWITHDOCTORORNOT, ((d2_researcher COL0 COL1 COL2 SHAREDWITHDOCTORORNOT ∧ ¬(∃ MECHANISMOFACTION, d23_researanddoc COL0 MECHANISMOFACTION)) ∧ SHAREDWITHDOCTORORNOT = ('Yes':string)) ∧ COL3 = ('No':string))) ∨ ((d23_researanddoc COL0 COL1 ∧ ¬(∃ MECHANISMOFACTION MODEOFACTION SHAREDWITHDOCTORORNOT, d2_researcher COL0 MECHANISMOFACTION MODEOFACTION SHAREDWITHDOCTORORNOT)) ∧ COL2 = ('to be added':string)) ∧ COL3 = ('Yes':string)) ∧ (d2_researcher COL0 COL1 COL2 COL3 ∧ ¬d23_researanddoc COL0 COL1) ∧ COL3 = ('Yes':string)) → false:= 
    begin
    intro h,
    try{rw[imp_false] at *},
    try{simp at *},
    revert h,
    z3_smt,
    end

theorem getput {d2_researcher: string → string → string → string → Prop}: true → (∃ COL0 COL1 COL2 COL3, (d2_researcher COL0 COL1 COL2 COL3 ∧ ¬(∃ SHAREDWITHDOCTORORNOT, (∃ MODEOFACTION, d2_researcher COL0 COL1 MODEOFACTION SHAREDWITHDOCTORORNOT) ∧ SHAREDWITHDOCTORORNOT = ('Yes':string))) ∧ COL3 = ('Yes':string)) ∨ (∃ COL0 COL1 COL2 COL3, ((∃ MECHANISMOFACTION1, ((d2_researcher COL0 MECHANISMOFACTION1 COL2 COL3 ∧ (∃ SHAREDWITHDOCTORORNOT, (∃ MODEOFACTION, d2_researcher COL0 COL1 MODEOFACTION SHAREDWITHDOCTORORNOT) ∧ SHAREDWITHDOCTORORNOT = ('Yes':string))) ∧ COL3 = ('Yes':string)) ∧ MECHANISMOFACTION1 ≠ COL1) ∨ (∃ SHAREDWITHDOCTORORNOT, ((d2_researcher COL0 COL1 COL2 SHAREDWITHDOCTORORNOT ∧ ¬(∃ COL1 SHAREDWITHDOCTORORNOT, (∃ MODEOFACTION, d2_researcher COL0 COL1 MODEOFACTION SHAREDWITHDOCTORORNOT) ∧ SHAREDWITHDOCTORORNOT = ('Yes':string))) ∧ SHAREDWITHDOCTORORNOT = ('Yes':string)) ∧ COL3 = ('No':string))) ∨ (((∃ SHAREDWITHDOCTORORNOT, (∃ MODEOFACTION, d2_researcher COL0 COL1 MODEOFACTION SHAREDWITHDOCTORORNOT) ∧ SHAREDWITHDOCTORORNOT = ('Yes':string)) ∧ ¬(∃ MECHANISMOFACTION MODEOFACTION SHAREDWITHDOCTORORNOT, d2_researcher COL0 MECHANISMOFACTION MODEOFACTION SHAREDWITHDOCTORORNOT)) ∧ COL2 = ('to be added':string)) ∧ COL3 = ('Yes':string)) → false:= 
    begin
    intro h,
    try{rw[imp_false] at *},
    try{simp at *},
    revert h,
    z3_smt,
    end

theorem putget {d23_researanddoc: string → string → Prop} {d2_researcher: string → string → string → string → Prop}: true → (∀ MECHANISMOFACTION MEDICATIONNAME, (∃ SHAREDWITHDOCTORORNOT, (∃ COL2, d2_researcher MEDICATIONNAME MECHANISMOFACTION COL2 SHAREDWITHDOCTORORNOT ∧ ¬((d2_researcher MEDICATIONNAME MECHANISMOFACTION COL2 SHAREDWITHDOCTORORNOT ∧ ¬d23_researanddoc MEDICATIONNAME MECHANISMOFACTION) ∧ SHAREDWITHDOCTORORNOT = ('Yes':string)) ∨ ((∃ MECHANISMOFACTION1, ((d2_researcher MEDICATIONNAME MECHANISMOFACTION1 COL2 SHAREDWITHDOCTORORNOT ∧ d23_researanddoc MEDICATIONNAME MECHANISMOFACTION) ∧ SHAREDWITHDOCTORORNOT = ('Yes':string)) ∧ MECHANISMOFACTION1 ≠ MECHANISMOFACTION) ∨ (∃ SHAREDWITHDOCTORORNOT', ((d2_researcher MEDICATIONNAME MECHANISMOFACTION COL2 SHAREDWITHDOCTORORNOT' ∧ ¬(∃ MECHANISMOFACTION, d23_researanddoc MEDICATIONNAME MECHANISMOFACTION)) ∧ SHAREDWITHDOCTORORNOT' = ('Yes':string)) ∧ SHAREDWITHDOCTORORNOT = ('No':string))) ∨ ((d23_researanddoc MEDICATIONNAME MECHANISMOFACTION ∧ ¬(∃ MECHANISMOFACTION MODEOFACTION SHAREDWITHDOCTORORNOT, d2_researcher MEDICATIONNAME MECHANISMOFACTION MODEOFACTION SHAREDWITHDOCTORORNOT)) ∧ COL2 = ('to be added':string)) ∧ SHAREDWITHDOCTORORNOT = ('Yes':string)) ∧ SHAREDWITHDOCTORORNOT = ('Yes':string)) ↔ d23_researanddoc MEDICATIONNAME MECHANISMOFACTION):= 
    begin
    intro h,
    try{rw[imp_false] at *},
    try{simp at *},
    revert h,
    z3_smt,
    end
