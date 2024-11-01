shader_type canvas_item;

uniform float raio : hint_range(0.0, 1.0, 0.01);
uniform float centerX;
uniform float centerY;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
    vec2 aspect_ratio = vec2(1.0, float(SCREEN_PIXEL_SIZE.x) / SCREEN_PIXEL_SIZE.y);
    vec2 uv_corrected = (UV - vec2(centerX, centerY)) * aspect_ratio + vec2(centerX, centerY);
    float dist = distance(uv_corrected, vec2(centerX, centerY));

    vec4 textureZ = texture(TEXTURE, UV);
    
    if (dist <= raio) {
        textureZ.a = 0.0;
    } else {
        textureZ = vec4(0.0, 0.0, 0.0, 1.0);
    }
    
    COLOR = textureZ;
}
