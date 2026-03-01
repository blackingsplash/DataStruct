local types_mod = require("./types")

return function(v: types_mod.AcceptedTypes)
	return {
		data = v :: types_mod.AcceptedTypes,
		next = nil :: types_mod.Node?,
	} :: types_mod.Node
end
