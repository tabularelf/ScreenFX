uniform float u_grain_amount;
uniform float u_grain_size;
uniform float u_time;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    vec4 colour = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    float noise = (fract(sin(dot(v_vTexcoord * u_time, vec2(12.9898, 78.233))) * 43758.5453) - 0.5) * 2.0;
	colour.rgb += noise * u_grain_amount * u_grain_size;

    gl_FragColor = clamp(colour, 0.0, 1.0);
}