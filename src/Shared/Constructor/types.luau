export type Node<T> = {
	data: T,
	next: Node<T>?,
}

export type LinkedList<T = number> = {
	top: Node<T>,
	bottom: Node<T>,
	height: number, -- replace with t.positiveInteger
	new: (v: T) -> LinkedList<T>,

	__add: (t: {}, v: LinkedList<T>) -> LinkedList<T>,
}

export type WeakLinkedList<T = number> = {
	top: Node<T>,
	bottom: Node<T>,
	height: number, -- replace with t.positiveInteger
	new: (v: T) -> LinkedList<T>,

	__add: (t: {}, v: LinkedList<T>) -> LinkedList<T>,
	__mode: "v" | "k" | "kv",
}

return {}
