#version 150 core

out vec4 fragColor;

uniform sampler2D diffuseTexture;
in vec2 texCoord;

void main()
{
    fragColor = vec4(texture(diffuseTexture, texCoord).xyz, 1.0);
}

