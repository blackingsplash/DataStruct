local types_mod = require("../Constructor/types")

export type GlobalConfig = {
	NodeLimit: number,
	MaxSizePerNode: number,
	BlacklistTypes: { types_mod.AcceptedTypes },
	ForceDeepClean: boolean,
	NumberPrecisionSnapping: number,
}

return table.freeze({
	NodeLimit = 50,
	MaxSizePerNode = 65535,
	BlacklistTypes = {},
	ForceDeepClean = true,
	NumberPrecisionSnapping = 4,
})
