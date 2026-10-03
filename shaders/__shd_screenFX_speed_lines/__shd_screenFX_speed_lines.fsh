uniform float u_line_count;
uniform float u_line_density;
uniform float u_line_speed;
uniform float u_line_falloff;

uniform float u_time;
uniform vec4 u_line_colour;
uniform vec2 u_resolution_pixel_size;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

float hash(float n) {
    return fract(sin(n) * 43758.5453123);
}

void main() {
    vec2 uv = v_vTexcoord;
    vec2 centered_uv = uv - vec2(0.5);

    float aspect = u_resolution_pixel_size.x / u_resolution_pixel_size.y;
    centered_uv.x /= aspect;

    float angle = atan(centered_uv.y, centered_uv.x);
    float dist = length(centered_uv);

    float n = hash(floor(angle * u_line_count));
    float thickness = abs(sin(angle * u_line_count + n));

    float speed = u_time * u_line_speed * (0.5 + n);
    float lines = step(u_line_density, fract(thickness + speed));

    float mask = smoothstep(u_line_falloff, u_line_falloff + 0.2, dist);
    float final_effect = lines * mask * u_line_colour.a;

    vec4 screen_col = texture2D( gm_BaseTexture, uv );

    vec3 mixed_color = mix(screen_col.rgb, u_line_colour.rgb, final_effect);

    gl_FragColor = vec4(mixed_color, 1.0);
}