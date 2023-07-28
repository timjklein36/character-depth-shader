shader_type spatial;
render_mode depth_test_disabled, unshaded;

uniform int magnitude = 16;
uniform sampler2D DEPTH_TEXTURE : hint_depth_texture, filter_linear_mipmap;

void fragment() {
    bool should_render = int(FRAGCOORD.x) % magnitude < magnitude / 2;

    if (int(FRAGCOORD.y) % magnitude < magnitude / 2) {
        should_render = !should_render;
    }

    float zdepth = texture(DEPTH_TEXTURE, SCREEN_UV).r;
    float zpos = FRAGCOORD.z;

	if (zdepth < zpos) {
        if (!should_render) {
            ALPHA = 0.0;
        } else {
            ALPHA = 1.0;
        }
	} else {
        discard;
	}
}
