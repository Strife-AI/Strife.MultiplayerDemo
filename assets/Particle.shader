// vertex
#version 330 core

uniform mat4x4 view;

in vec3 position;
in vec3 offset;
in vec2 textureCoord;
in vec4 color;

out vec2 TexCoord;
out vec4 Color;

void main()
{
    gl_Position = view * vec4(position + offset, 1.0);
    TexCoord = textureCoord;
    Color = color;
}

// fragment
#version 330 core

uniform sampler2D spriteTexture;

in vec2 TexCoord;
in vec4 Color;

out vec4 FragColor;

void main()
{
    vec4 texel = texture(spriteTexture, TexCoord);

    if(texel.a == 0) discard;

    FragColor = vec4(mix(texel.rgb, Color.rgb, Color.a), texel.a);
}