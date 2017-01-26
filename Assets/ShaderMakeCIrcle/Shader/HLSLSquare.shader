Shader "Template"{
	SubShader{

		Tags { "RenderType"="Opaque" }
		LOD 100

		Pass{
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment frag

			#include "UnityCG.cginc"

			float lengthN(float2 v, float n){
				float2 tmp = pow(abs(v),float2(n,n));
				return float(tmp.x+tmp.y);
			}

			float plazma(float2 p){
				p*= 10.0;
				return (sin(p.x)+0.25+sin(p.y)+0.25);
			}



			fixed4 frag (v2f_img i) : SV_Target{

				float2 p = (i.uv)+float2(0.5,0.5);
				float index = floor(p.x * 4.0);
	p.y += index * 0.2;
				float s = _Time*30 ;
				float2 r = float2(sin(p.x+s*0.1f),cos(p.y+s*0.1f));
				float2 g = float2(cos(p.x+s*0.1f),cos(p.y+s*0.1f));
				float2 b = float2(sin(p.x+s*0.1f),0);


				return float4(plazma(r),plazma(g),plazma(b),1);
			}
			ENDCG
		}
	}
}