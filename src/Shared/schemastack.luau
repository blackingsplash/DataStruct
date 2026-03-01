--!optimize 2
local types_mod = require("./Constructor/types")

type Unionized<T, K> = types_mod.JoinedSchematizedLinkedList<T, K>
export type SchematizedLinkedList<T> = types_mod.SchematizedLinkedList<T>
