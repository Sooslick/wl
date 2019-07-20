//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vDestinationTexcoord;  //texcoord of vertex relative to destination texture
uniform vec2 texel_size; // x = 1 / width of destination texture, y = 1 / height of destination texture

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4( in_Position, 1.0);
    v_vDestinationTexcoord = in_Position.xy * texel_size;
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vDestinationTexcoord;
uniform sampler2D destination; //destination (probably application surface) texture

void main()
{
    vec4 dest_color = texture2D( destination, v_vDestinationTexcoord ); //color of destination at fragment position
    vec4 source_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );  //color of source at fragment position
    gl_FragColor = vec4( 1.0 - dest_color.rgb, source_color.a );
}

