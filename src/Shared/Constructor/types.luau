export type AcceptedTypes = "string" | "number" | "boolean" | "vector" | "buffer" | "table"

export type GlobalConfig = {
	NodeLimit: number,
	MaxSizePerNode: number,
}

export type Node = {
	data: unknown,
	next: Node?,
}

export type LinkedList = {
	top: Node?,
	height: number,
	maxNodeAmount: number,
	maxByteSizePerNode: number,
	--lastModification: number,
	--changeCount: number,
	-- forceDeepClean: boolean,
	locked: boolean,
	isfrozen: boolean,
}

export type Stack = LinkedList & {
	create: (v: unknown, config: GlobalConfig?) -> LinkedList,
	push: (self: LinkedList, v: unknown) -> (),
	pop: (self: LinkedList) -> unknown,
	peek: (self: LinkedList) -> Node?,
	deepClean: (self: LinkedList) -> (),
	freeze: (self: LinkedList, deepFreeze: boolean?) -> LinkedList,
	some: (self: LinkedList, predicate: (v: unknown) -> boolean) -> boolean,
}

export type SchematizedLinkedList<T> = {
	top: Node?,
	height: number,
	maxNodeAmount: number,
	maxByteSizePerNode: number,
	registeredType: string?,
	locked: boolean,
	isfrozen: boolean,
}

export type SchematizedStack<T = unknown> = SchematizedLinkedList<T> & {
	create: (v: T, config: GlobalConfig?) -> SchematizedLinkedList<T>,
	push: (self: SchematizedLinkedList<T>, v: T) -> (),
	pop: (self: SchematizedLinkedList<T>) -> T?,
	peek: (self: SchematizedLinkedList<T>) -> T?,
	deepClean: (self: SchematizedLinkedList<T>) -> (),
	freeze: (self: SchematizedLinkedList<T>, deepFreeze: boolean?) -> SchematizedLinkedList<T>,
	some: (self: SchematizedLinkedList<T>, predicate: (v: T) -> boolean) -> boolean,
}

return {}
