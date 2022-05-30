///@shader shaderMagnify
///@description Fragment shader.
///@uniform {vec2(width, height)} resolution
///@uniform {vec2(x, y)} position
///@uniform {float} radius
///@uniform {float} minZoom
///@uniform {float} maxZoom


	varying vec4 inputColor;
	varying vec2 inputTexture;
	
	uniform vec2 resolution;
	uniform vec2 position;
	uniform float radius;
	uniform float minZoom;
	uniform float maxZoom;
	

	void main() {
		/*
		vec4 outputPixel = inputColor * texture2D(gm_BaseTexture, inputTexture);
        vec2 texture = inputTexture;
	    texture.x *= (resolution.x / resolution.y);
	    float centerX = (position.x / resolution.x) * (resolution.x / resolution.y);
	    float centerY = position.y / resolution.y;
  
	    float maxX = centerX + radius;
	    float minX = centerX - radius;
	    float maxY = centerY + radius;
	    float minY = centerY - radius;

	    if ((texture.x > minX) && 
			(texture.x < maxX) && 
			(texture.y > minY) && 
			(texture.y < maxY)) {
				
	        float relX = texture.x - centerX;
	        float relY = texture.y - centerY;
	        float ang =  atan(relY, relX);
	        float dist = sqrt(relX * relX + relY * relY);
			if (dist <= radius) {
		        float newRad = dist * ((maxZoom * (dist / radius)) + minZoom);
		        float newX = centerX + cos(ang) * newRad;
		        newX *= (resolution.y / resolution.x);
		        float newY = centerY + sin(ang) * newRad;
		        outputPixel = texture2D(gm_BaseTexture, vec2(newX, newY));
		    }
		}
		
		/// Pass pixel to renderer
		gl_FragColor = outputPixel;
		*/
		
		vec4 base_texture = texture2D(gm_BaseTexture, inputTexture);
        
	    vec2 uv = inputTexture;
	    uv.x *= (resolution.x/resolution.y);
	    float centre_x = (position.x / resolution.x) * (resolution.x/resolution.y);
	    float centre_y = position.y / resolution.y;
  
	    float maxX = centre_x + radius;
	    float minX = centre_x - radius;
	    float maxY = centre_y + radius;
	    float minY = centre_y - radius;

	    if( uv.x > minX && uv.x < maxX && uv.y > minY && uv.y < maxY)
	    {
	        float relX = uv.x - centre_x;
	        float relY = uv.y - centre_y;
	        float ang =  atan(relY, relX);
	        float dist = sqrt(relX*relX + relY*relY);
    
		    if( dist <= radius )
		    {
		        float newRad = dist * ( (maxZoom * dist/radius) + minZoom );
		        float newX = centre_x + cos( ang ) * newRad;
		        newX *= (resolution.y/resolution.x);
		        float newY = centre_y + sin( ang ) * newRad;
		        gl_FragColor = texture2D(gm_BaseTexture, vec2(newX, newY) );
		    }
		    else
		    {
		        gl_FragColor = base_texture;
		    }
    
		}
		else
		{
		    gl_FragColor = base_texture;
		}  
	}
	
