Shader "Template"{
	SubShader{

		Tags { "RenderType"="Opaque" }
		LOD 100

		Pass{
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment frag

			#include "UnityCG.cginc"

			float rings(float2 p){
				return sin(length(p)*_Time*100);
			}

			fixed4 frag (v2f_img i) : SV_Target{

				float2 p = (i.uv)-float2(0.5,0.5);
				return float4(rings(p),rings(p),rings(p),1);
			}
			ENDCG
		}
	}
}