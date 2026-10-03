// feather ignore all
/// @param {Struct} vars
function ScreenFXEffectFilmGrain(_vars = undefined) : ScreenFXBaseEffectClass(_vars) constructor {
	static __name = "Film Grain";
	static __priority = 8;
	static __shader = __shd_screenFX_film_grain;

	static _uTime = shader_get_uniform(__shader, "u_time");
	static _uGrainAmount = shader_get_uniform(__shader, "u_grain_amount");
	static _uGrainSize = shader_get_uniform(__shader, "u_grain_size");

	ScreenFXEffectVarsEnsure(
		"amount", 0.05,
		"size", 1,
	);

	static __Apply = function(_surf, _time) {
		shader_set(__shader);
		shader_set_uniform_f(_uTime, _time);
		shader_set_uniform_f(_uGrainAmount, vars.amount);
		shader_set_uniform_f(_uGrainSize, vars.size);
		draw_surface(_surf, 0, 0);
		shader_reset();
	};
}