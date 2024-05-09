#define FP highp

uniform FP vec3 maincolor;

void main()
{
    //output color from material
//    gl_FragColor = vec4(maincolor,1.0);
    gl_FragColor = vec4(0.1, 0.5, 0.9, 1.0);
}

