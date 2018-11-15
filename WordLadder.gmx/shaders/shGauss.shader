//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float tense;
//uniform float spread;  //todo
//uniform quality //todo

void main()
{
float i = 0.0;
float j = 0.0;
float pc = 0.0;
vec4 clr = vec4(0.0,0.0,0.0,0.0);
for (j = 0.0; j < 6.283; j+= 0.786) {   //2pi, pi/4
  for (i = 0.002; i < 0.01; i+= 0.002) {
    clr+= v_vColour * texture2D( gm_BaseTexture, vec2(v_vTexcoord.x+i*cos(j), v_vTexcoord.y+i*sin(j)) );
    pc+= tense;
    }
  }
clr/= pc;
gl_FragColor = clr;
}

