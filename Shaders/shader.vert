#version 330

layout (location = 0) in vec3 pos;
layout (location = 1) in vec3 norm;

out vec4 vCol;
out vec3 normal_vector;
out vec3 frag_pos;

uniform mat4 model;
uniform mat4 projection;
uniform mat4 view;

void main()
{
	gl_Position = projection * view * model * vec4(pos, 1.0);
	vCol = vec4(1.0f, 1.0f, 1.0f, 1.0f);
	normal_vector = mat3(transpose(inverse(model))) * norm;
	frag_pos = (model * vec4(pos, 1.0)).xyz;
}