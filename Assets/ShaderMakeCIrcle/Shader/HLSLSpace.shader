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

			float rings(float2 p){
				return sin(lengthN(p,4.0)*1000.0*sin(_Time));
			}

			fixed4 frag (v2f_img i) : SV_Target{

				float2 p = (i.uv)-float2(0.5,0.5);
				return float4(rings(p),rings(p),rings(p),1);
			}
			ENDCG
		}
	}
}