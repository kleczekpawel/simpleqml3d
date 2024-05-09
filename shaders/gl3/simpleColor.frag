#version 150 core

//uniform vec3 maincolor;
out vec4 fragColor;

in vec4 vertexColor; // the input variable from the vertex shader (same name and same type)

uniform sampler2D diffuseTexture;
in vec3 position;
in vec2 texCoord;

void main()
{
    //output color from material
//    fragColor = vec4(maincolor,1.0);
//    fragColor = vec4(0.8, 0.1, 0.4, 1.0);
//    fragColor = vec4(1.0, 0.0, 0.0, 1.0);  // red

//    fragColor = vertexColor;
    fragColor = vec4(texture(diffuseTexture, texCoord).xyz, 1.0);
}

