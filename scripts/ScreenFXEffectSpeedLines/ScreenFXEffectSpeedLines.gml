// feather ignore all
/// @param {Struct} vars
function ScreenFXEffectSpeedLines(_vars = undefined) : ScreenFXBaseEffectClass(_vars) constructor {
	static __name = "Speed lines";
	static __priority = 4;
	static __shader = __shd_screenFX_speed_lines;

	static _uLineCount = shader_get_uniform(__shader, "u_line_count");
	static _uLineDensity = shader_get_uniform(__shader, "u_line_density");
	static _uLineSpeed = shader_get_uniform(__shader, "u_line_speed");
	static _uLineFalloff = shader_get_uniform(__shader, "u_line_falloff");
	static _uLineColour = shader_get_uniform(__shader, "u_line_colour");
	static _uResolutionPixelSize = shader_get_uniform(__shader, "u_resolution_pixel_size");
	static _uTime = shader_get_uniform(__shader, "u_time");

	ScreenFXEffectVarsEnsure(
		"line_count", 40,
		"line_density", 0.4,
		"line_speed", 8.0,
		"line_falloff", 0.3,
		"line_colour", c_white,
		"line_alpha", 0.5,
	);

	static __DirtyCallback = function() {
		vars.line_alpha = clamp(vars.line_alpha, 0, 1);
	};

	static __Apply = function(_surf, _time) {
		shader_set(__shader);
		var _tex = surface_get_texture(_surf);
		shader_set_uniform_f(_uTime, _time);
		shader_set_uniform_f(_uResolutionPixelSize, texture_get_texel_width(_tex), texture_get_texel_height(_tex));

		shader_set_uniform_f(_uLineCount, vars.line_count);
		shader_set_uniform_f(_uLineDensity, vars.line_density);
		shader_set_uniform_f(_uLineSpeed, vars.line_speed);
		shader_set_uniform_f(_uLineFalloff, vars.line_falloff);
		shader_set_uniform_f(_uLineColour, colour_get_red(vars.line_colour), colour_get_green(vars.line_colour), colour_get_blue(vars.line_colour), vars.line_alpha);
		draw_surface(_surf, 0, 0);
		shader_reset();
	};
}