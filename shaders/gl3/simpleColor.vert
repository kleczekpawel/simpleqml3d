#version 150 core

in vec3 vertexPosition;
out vec3 worldPosition;
uniform mat4 modelMatrix;
uniform mat4 mvp;

uniform vec4 ourColor; // we set this variable in the OpenGL code.

out vec4 vertexColor; // specify a color output to the fragment shader

in vec2 vertexTexCoord;
out vec3 position;
out vec2 texCoord;

void main()
{
    // Transform position, normal, and tangent to world coords
    worldPosition = vec3(modelMatrix * vec4(vertexPosition, 1.0));

    // Calculate vertex position in clip coordinates
    gl_Position = mvp * vec4(worldPosition, 1.0);

//    // vertexColor = vec4(0.5, 0.0, 0.0, 1.0);
//    vertexColor = ourColor;

//    vec3 t = vec3(vertexTexCoord, 1.0);
//    texCoord = (t / t.z).xy;
    texCoord = vec2(vertexTexCoord.x, vertexTexCoord.y);  // whole texture
    texCoord = vec2(vertexTexCoord.x, 0.0);  // bottom row
    texCoord = vec2(0.0, vertexTexCoord.y);  // left column
    texCoord = vec2(0.0, vertexTexCoord.x);

    //    position = vec3(modelView * vec4(vertexPosition, 1.0));
    position = vec3(modelMatrix * vec4(vertexPosition, 1.0));
}
