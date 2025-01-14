#ifdef GL_ES
  precision mediump float;
#endif

uniform vec4 resolution;
uniform vec2 mouse;
uniform vec2 threshold;
uniform float time;
uniform float pixelRatio;
uniform sampler2D image0;
uniform sampler2D image1;


vec2 mirrored(vec2 v) {
  vec2 m = mod(v,2.);
  return mix(m,2.0 - m, step(1.0 ,m));
}

void main() {
  // uvs and textures
  vec2 uv = pixelRatio*gl_FragCoord.xy / resolution.xy ;
  vec2 vUv = (uv - vec2(0.5))*resolution.zw + vec2(0.5);
  vUv.y = 1. - vUv.y;
  vec4 tex1 = texture2D(image1,mirrored(vUv));
  float depth = tex1.g;

  float displacementx = vUv.x + (depth - 0.05) * mouse.x / threshold.x;
  float displacementy = vUv.y + (depth - 0.05) * mouse.y / threshold.y;
  vec2 fake3d = vec2(displacementx, displacementy);
  gl_FragColor = texture2D(image0,mirrored(fake3d));
}