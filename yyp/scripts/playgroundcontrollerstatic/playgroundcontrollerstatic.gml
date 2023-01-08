///@function appendPointToVertexBuffer(vbuffer, xx, yy, zz, nx, ny, nz, utex, vtex, color, alpha)
///@param {VertexBuffer} vbuffer
///@param xx
///@param yy
///@param zz
///@param nx
///@param ny
///@param nz
///@param utex
///@param vtex
///@param color
///@param alpha
function appendPointToVertexBuffer(vbuffer, xx, yy, zz, nx, ny, nz, utex, vtex, color, alpha) {

	vertex_position_3d(vbuffer, xx, yy, zz);
	vertex_normal(vbuffer, nx, ny, nz);
	vertex_texcoord(vbuffer, utex, vtex);
	vertex_color(vbuffer, color, alpha);
}
