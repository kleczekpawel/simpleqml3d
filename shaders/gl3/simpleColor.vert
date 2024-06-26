#version 150 core

in vec3 vertexPosition;
out vec3 worldPosition;
uniform mat4 modelMatrix;
uniform mat4 mvp;

in vec2 vertexTexCoord;
out vec2 texCoord;

void main()
{
    // Transform position, normal, and tangent to world coords
    worldPosition = vec3(modelMatrix * vec4(vertexPosition, 1.0));

    // Calculate vertex position in clip coordinates
    gl_Position = mvp * vec4(worldPosition, 1.0);

    texCoord = vec2(0.0, vertexTexCoord.x);
}
