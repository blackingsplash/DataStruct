--!optimize 2
local types: {} = require("./Constructor/types")
local _config: {} = require("../Config/config")
local node: (v: any) -> ConstructorNode<any> = require("./Constructor/node")
local t = require("./Packages/t")

export type ConstructorNode<K> = types.Node<K>
export type Constructor = types.LinkedList

local methods = {}
methods.__index = methods

function methods.new(v: any)
	local curr: ConstructorNode<any> = node(v)
	return setmetatable(methods, {
		top = curr :: ConstructorNode<any>,
		bottom = curr :: ConstructorNode<any>,
		height = 0 :: number,
		locked = false :: boolean,
	})
end

function methods:push(v: any): ()
	if not t.any(v) then
		error(`expected type notnil, got {typeof(v)}`)
	end
	if self.locked then
		error("stack is already locked by another thread; push method is invalid.")
	end

	local curr: ConstructorNode<any> = node(v)
	if self.height > 0 then
		curr.next = self.top
		self.top = curr
	else
		self.top = curr
		self.bottom = curr
	end
	self.height += 1
end

function methods:pop(): any
	if self.height == 0 or not self.top then
		error("no nodes to pop in stack")
	end
	if self.locked then
		error("stack is already locked by another thread; pop method is invalid.")
	end

	self.locked = true
	local res: ConstructorNode<any>? = self.top

	self.top = self.top.next
	res.next = nil
	self.height -= 1

	if self.height == 0 then
		self.bottom = nil
	end

	self.locked = false
	return res.data
end

function methods:peek(): ConstructorNode<any>?
	if self.height == 0 or not self.top then
		return nil
	elseif self.locked then
		error("stack is already locked by another thread; peek method is invalid.")
	else
		return self.top
	end
end

return methods :: Constructor
