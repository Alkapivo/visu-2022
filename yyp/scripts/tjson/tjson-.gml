// TJSON Copyright (c) YellowAfterlife, 2016+
// Generated at 2020-06-23 18:03:46 (357ms) for v2.3+
enum tj_type { null, boolean, number, string, array, object, error, unknown }

//{ tj_std.Std

function tj_std_Std_stringify(_value) {
	// tj_std_Std_stringify(value:dynamic)->string
	if (_value == undefined) return "null";
	if (is_string(_value)) return _value;
	var _n, _i, _s;
	if (is_struct(_value)) {
		var _e = variable_struct_get(_value, "__enum__");
		if (_e == undefined) return string(_value);
		var _ects = _e.constructors;
		if (_ects != undefined) {
			_i = _value.__enumIndex__;
			if (_i >= 0 && _i < array_length(_ects)) _s = _ects[_i]; else _s = "?";
		} else {
			_s = instanceof(_value);
			if (string_copy(_s, 1, 3) == "mc_") _s = string_delete(_s, 1, 3);
			_n = string_length(_e.name);
			if (string_copy(_s, 1, _n) == _e.name) _s = string_delete(_s, 1, _n + 1);
		}
		_s += "(";
		var _fields = _value.__enumParams__;
		_n = array_length(_fields);
		for (_i = -1; ++_i < _n; _s += tj_std_Std_stringify(variable_struct_get(_value, _fields[_i]))) {
			if (_i > 0) _s += ", ";
		}
		return _s + ")";
	}
	if (is_real(_value)) {
		_s = string_format(_value, 0, 16);
		if (os_browser != -1) {
			_n = string_length(_s);
			_i = _n;
			while (_i > 0) {
				switch (string_ord_at(_s, _i)) {
					case 48:
						_i--;
						continue;
					case 46: _i--; break;
				}
				break;
			}
		} else {
			_n = string_byte_length(_s);
			_i = _n;
			while (_i > 0) {
				switch (string_byte_at(_s, _i)) {
					case 48:
						_i--;
						continue;
					case 46: _i--; break;
				}
				break;
			}
		}
		return string_copy(_s, 1, _i);
	}
	return string(_value);
}

function tj_std_Std_parseFloat(_s) {
	// tj_std_Std_parseFloat(s:string)->real
	var _l = string_length(_s);
	var _n = string_length(string_digits(_s));
	var _p = string_pos(".", _s);
	var _e = string_pos("e", _s);
	if (_e == 0) _e = string_pos("E", _s);
	switch (_e) {
		case 0: break;
		case 1: return NaN;
		case 2: if (_p > 0) return NaN; break;
		default: if (_p > 0 && _e < _p) return NaN;
	}
	if (_e != 0 && _e < _l - 1) switch (string_ord_at(_s, _e + 1)) {
		case 43: case 45: _l--; break;
	}
	if (_n && _n == _l - (string_ord_at(_s, 1) == 45) - (_p != 0) - (_e != 0)) return real(_s); else return NaN;
}

//}

//{ tj.stringbuf

function tj_stringbuf_add_sub(_this1, _s, _pos, _len) {
	// tj_stringbuf_add_sub(this:buffer, s:TjSource, pos:int, len:int)
	var _p = buffer_tell(_this1);
	var _l = buffer_get_size(_this1);
	var _f = _pos + _len;
	while (_l < _f) {
		_l *= 2;
		buffer_resize(_this1, _l);
	}
	buffer_copy(_s, _pos, _len, _this1, _p);
	buffer_seek(_this1, buffer_seek_relative, _len);
}

function tj_stringbuf_to_string(_this1) {
	// tj_stringbuf_to_string(this:buffer)->string
	buffer_write(_this1, buffer_u8, 0);
	buffer_seek(_this1, buffer_seek_start, 0);
	return buffer_read(_this1, buffer_string);
}

//}

//{ tj_decode

function tj_decode_uxchar(_pos) {
	// tj_decode_uxchar(pos:int)->TjValue
	tj_error_text = ("Unexpected character " + tj_std_Std_stringify(buffer_peek(tj_decode_source, _pos - 1, buffer_u8))) + " at position " + string(_pos) + ".";
	return tj_error;
}

function tj_decode_string() {
	// tj_decode_string()->TjValue
	var _src = tj_decode_source;
	var _ofs = tj_decode_offset;
	var _len = tj_decode_length;
	var _start = _ofs;
	var _sub;
	var _this1 = tj_decode_string_buf;
	buffer_seek(_this1, buffer_seek_start, 0);
	var _buf = _this1;
	while (_ofs < _len) {
		var _c = buffer_peek(_src, _ofs++, buffer_u8);
		if (_c == 34) {
			tj_decode_offset = _ofs;
			tj_stringbuf_add_sub(_buf, _src, _start, _ofs - _start - 1);
			return tj_stringbuf_to_string(_buf);
		} else if (_c == 92) {
			tj_stringbuf_add_sub(_buf, _src, _start, _ofs - _start - 1);
			_c = buffer_peek(_src, _ofs++, buffer_u8);
			switch (_c) {
				case 114: buffer_write(_buf, buffer_u8, 13); break;
				case 110: buffer_write(_buf, buffer_u8, 10); break;
				case 116: buffer_write(_buf, buffer_u8, 9); break;
				case 98: buffer_write(_buf, buffer_u8, 8); break;
				case 102: buffer_write(_buf, buffer_u8, 12); break;
				case 34: case 47: case 92: buffer_write(_buf, buffer_u8, _c); break;
				case 117:
					var _uc = 0;
					repeat (4) {
						_c = buffer_peek(_src, _ofs++, buffer_u8);
						if (_c >= 48 && _c <= 57) {
							_c -= 48;
						} else if (_c >= 65 && _c <= 70) {
							_c -= 55;
						} else if (_c >= 97 && _c <= 102) {
							_c -= 87;
						} else _c = 0;
						_uc = ((_uc << 4) | _c);
					}
					if (_uc <= 127) {
						buffer_write(_buf, buffer_u8, _uc);
					} else if (_uc <= 2047) {
						buffer_write(_buf, buffer_u8, (192 | (_uc >> 6)));
						buffer_write(_buf, buffer_u8, (128 | (_uc & 63)));
					} else if (_uc <= 65535) {
						buffer_write(_buf, buffer_u8, (224 | (_uc >> 12)));
						buffer_write(_buf, buffer_u8, (128 | ((_uc >> 6) & 63)));
						buffer_write(_buf, buffer_u8, (128 | (_uc & 63)));
					} else {
						buffer_write(_buf, buffer_u8, (240 | (_uc >> 18)));
						buffer_write(_buf, buffer_u8, (128 | ((_uc >> 12) & 63)));
						buffer_write(_buf, buffer_u8, (128 | ((_uc >> 6) & 63)));
						buffer_write(_buf, buffer_u8, (128 | (_uc & 63)));
					}
					break;
				default:
					tj_error_text = "Invalid escape sequence at position " + string(_ofs - 1) + ".";
					return tj_error;
			}
			_start = _ofs;
		}
	}
	tj_error_text = "Unclosed string at position " + string(tj_decode_offset - 1) + ".";
	return tj_error;
}

function tj_decode_number(_c) {
	// tj_decode_number(c:int)->TjValue
	var _src = tj_decode_source;
	var _ofs = tj_decode_offset;
	var _len = tj_decode_length;
	var _start = _ofs - 1;
	var _neg = _c == 45;
	var _dig = !_neg;
	var _zero = _c == 48;
	var _dot = false;
	var _epo = -1;
	var _eso = -1;
	var _sub;
	while (_ofs < _len) {
		_c = buffer_peek(_src, _ofs++, buffer_u8);
		switch (_c) {
			case 48:
				if (_zero && !_dot) {
					tj_error_text = "Invalid number at position " + string(_start) + ".";
					return tj_error;
				}
				if (_neg) {
					_neg = false;
					_zero = true;
				}
				_dig = true;
				break;
			case 46:
				if (_neg || _dot) {
					tj_error_text = "Invalid number at position " + string(_start) + ".";
					return tj_error;
				}
				_dig = false;
				_dot = true;
				break;
			case 69: case 101:
				if (_neg || _epo >= 0) {
					tj_error_text = "Invalid number at position " + string(_start) + ".";
					return tj_error;
				}
				_dig = false;
				_epo = _ofs;
				break;
			case 43: case 45:
				if (_epo < 0 || _eso >= 0) {
					tj_error_text = "Invalid number at position " + string(_start) + ".";
					return tj_error;
				}
				_dig = false;
				_eso = _ofs;
				break;
			default:
				if (_c >= 49 && _c <= 57) {
					if (_zero && !_dot) {
						tj_error_text = "Invalid number at position " + string(_start) + ".";
						return tj_error;
					}
					_dig = true;
					_zero = false;
					_neg = false;
				} else {
					if (!_dig) {
						tj_error_text = "Invalid number at position " + string(_start) + ".";
						return tj_error;
					}
					_ofs--;
					if (_epo == _ofs || _eso == _ofs) {
						tj_error_text = "Invalid number at position " + string(_start) + ".";
						return tj_error;
					} else {
						tj_decode_offset = _ofs;
						_sub = tj_source_sub(_src, _start, _ofs - _start);
						return tj_std_Std_parseFloat(_sub);
					}
				}
		}
	}
	if (_epo == _ofs || _eso == _ofs) {
		tj_error_text = "Invalid number at position " + string(_start) + ".";
		return tj_error;
	} else {
		tj_decode_offset = _ofs;
		_sub = tj_source_sub(_src, _start, _ofs - _start);
		return tj_std_Std_parseFloat(_sub);
	}
}

function tj_decode_value() {
	// tj_decode_value()->TjValue
	var _src = tj_decode_source;
	var _ofs = tj_decode_offset;
	var _len = tj_decode_length;
	var _start, _sep, _sub, _num, _key, _val, _out, _i, _n, _keys, _vals, __depool_i, __depool_r;
	while (_ofs < _len) {
		var _c = buffer_peek(_src, _ofs++, buffer_u8);
		switch (_c) {
			case 9: case 10: case 13: case 32: break;
			case 123:
				_start = _ofs;
				__depool_i = ds_list_size(tj_decode_list_pool) - 1;
				if (__depool_i >= 0) {
					__depool_r = tj_decode_list_pool[|__depool_i];
					ds_list_delete(tj_decode_list_pool, __depool_i);
					_keys = __depool_r;
				} else _keys = ds_list_create();
				__depool_i = ds_list_size(tj_decode_list_pool) - 1;
				if (__depool_i >= 0) {
					__depool_r = tj_decode_list_pool[|__depool_i];
					ds_list_delete(tj_decode_list_pool, __depool_i);
					_vals = __depool_r;
				} else _vals = ds_list_create();
				_sep = true;
				while (_ofs < _len) {
					_c = buffer_peek(_src, _ofs++, buffer_u8);
					switch (_c) {
						case 9: case 10: case 13: case 32: break;
						case 125:
							tj_decode_offset = _ofs;
							_n = ds_list_size(_vals);
							_out = { }
							_i = -1;
							while (++_i < _n) {
								variable_struct_set(_out, _keys[|_i], _vals[|_i]);
							}
							__depool_r = _keys;
							ds_list_clear(__depool_r);
							ds_list_add(tj_decode_list_pool, __depool_r);
							__depool_r = _vals;
							ds_list_clear(__depool_r);
							ds_list_add(tj_decode_list_pool, __depool_r);
							return _out;
						case 44:
							if (_sep) {
								__depool_r = _keys;
								ds_list_clear(__depool_r);
								ds_list_add(tj_decode_list_pool, __depool_r);
								__depool_r = _vals;
								ds_list_clear(__depool_r);
								ds_list_add(tj_decode_list_pool, __depool_r);
								return tj_decode_uxchar(_ofs);
							} else _sep = true;
							break;
						default:
							if (_c != 34 && !(tj_allow_value_keys || tj_allow_ident_keys) || !_sep) {
								__depool_r = _keys;
								ds_list_clear(__depool_r);
								ds_list_add(tj_decode_list_pool, __depool_r);
								__depool_r = _vals;
								ds_list_clear(__depool_r);
								ds_list_add(tj_decode_list_pool, __depool_r);
								return tj_decode_uxchar(_ofs);
							}
							if (_c != 34) {
								tj_decode_offset = _ofs - 1;
								if (tj_allow_ident_keys && (_c == 95 || _c >= 97 && _c <= 122 || _c >= 65 && _c <= 90)) {
									while (_ofs < _len) {
										_c = buffer_peek(_src, _ofs, buffer_u8);
										if (_c == 95 || _c >= 97 && _c <= 122 || _c >= 65 && _c <= 90) _ofs++; else break;
									}
									_key = tj_source_sub(_src, tj_decode_offset, _ofs - tj_decode_offset);
									if (tj_allow_value_keys) switch (_key) {
										case "true": _key = tj_true; break;
										case "false": _key = tj_false; break;
										case "null": _key = undefined; break;
									}
									tj_decode_offset = _ofs;
								} else if (tj_allow_value_keys) {
									_key = tj_decode_value();
								} else {
									__depool_r = _keys;
									ds_list_clear(__depool_r);
									ds_list_add(tj_decode_list_pool, __depool_r);
									__depool_r = _vals;
									ds_list_clear(__depool_r);
									ds_list_add(tj_decode_list_pool, __depool_r);
									return tj_decode_uxchar(_ofs);
								}
							} else {
								tj_decode_offset = _ofs;
								_key = tj_decode_string();
							}
							if (_key == tj_error) {
								__depool_r = _keys;
								ds_list_clear(__depool_r);
								ds_list_add(tj_decode_list_pool, __depool_r);
								__depool_r = _vals;
								ds_list_clear(__depool_r);
								ds_list_add(tj_decode_list_pool, __depool_r);
								return _key;
							}
							_ofs = tj_decode_offset;
							while (_ofs < _len) {
								_c = buffer_peek(_src, _ofs++, buffer_u8);
								switch (_c) {
									case 9: case 10: case 13: case 32: continue;
								}
								if (_c != 58) {
									__depool_r = _keys;
									ds_list_clear(__depool_r);
									ds_list_add(tj_decode_list_pool, __depool_r);
									__depool_r = _vals;
									ds_list_clear(__depool_r);
									ds_list_add(tj_decode_list_pool, __depool_r);
									return tj_decode_uxchar(_ofs);
								} else break;
							}
							tj_decode_offset = _ofs;
							_val = tj_decode_value();
							if (_val == tj_error) {
								__depool_r = _keys;
								ds_list_clear(__depool_r);
								ds_list_add(tj_decode_list_pool, __depool_r);
								__depool_r = _vals;
								ds_list_clear(__depool_r);
								ds_list_add(tj_decode_list_pool, __depool_r);
								return _val;
							}
							_ofs = tj_decode_offset;
							ds_list_add(_keys, _key);
							ds_list_add(_vals, _val);
							_sep = false;
					}
				}
				__depool_r = _keys;
				ds_list_clear(__depool_r);
				ds_list_add(tj_decode_list_pool, __depool_r);
				__depool_r = _vals;
				ds_list_clear(__depool_r);
				ds_list_add(tj_decode_list_pool, __depool_r);
				tj_error_text = "Unclosed curly bracket at position " + string(_start) + ".";
				return tj_error;
			case 91:
				_start = _ofs;
				__depool_i = ds_list_size(tj_decode_list_pool) - 1;
				if (__depool_i >= 0) {
					__depool_r = tj_decode_list_pool[|__depool_i];
					ds_list_delete(tj_decode_list_pool, __depool_i);
					_vals = __depool_r;
				} else _vals = ds_list_create();
				_sep = true;
				while (_ofs < _len) {
					_c = buffer_peek(_src, _ofs++, buffer_u8);
					switch (_c) {
						case 9: case 10: case 13: case 32: break;
						case 44:
							if (_sep) {
								__depool_r = _vals;
								ds_list_clear(__depool_r);
								ds_list_add(tj_decode_list_pool, __depool_r);
								return tj_decode_uxchar(_ofs);
							} else _sep = true;
							break;
						case 93:
							tj_decode_offset = _ofs;
							_n = ds_list_size(_vals);
							_out = undefined;
							_out = array_create(_n);
							for (_i = 0; _i < _n; _i++) {
								_out[@_i] = _vals[|_i];
							}
							__depool_r = _vals;
							ds_list_clear(__depool_r);
							ds_list_add(tj_decode_list_pool, __depool_r);
							return _out;
						default:
							if (_sep) {
								tj_decode_offset = _ofs - 1;
								_val = tj_decode_value();
								if (_val == tj_error) {
									__depool_r = _vals;
									ds_list_clear(__depool_r);
									ds_list_add(tj_decode_list_pool, __depool_r);
									return _val;
								}
								ds_list_add(_vals, _val);
								_ofs = tj_decode_offset;
								_sep = false;
							} else {
								__depool_r = _vals;
								ds_list_clear(__depool_r);
								ds_list_add(tj_decode_list_pool, __depool_r);
								return tj_decode_uxchar(_ofs);
							}
					}
				}
				__depool_r = _vals;
				ds_list_clear(__depool_r);
				ds_list_add(tj_decode_list_pool, __depool_r);
				tj_error_text = "Unclosed square bracket at position " + string(_start) + ".";
				return tj_error;
			case 34:
				tj_decode_offset = _ofs;
				_val = tj_decode_string();
				if (_val == tj_error) return _val;
				return _val;
			case 45:
				tj_decode_offset = _ofs;
				_num = tj_decode_number(45);
				return _num;
			case 116:
				_start = _ofs;
				if (buffer_peek(_src, _ofs++, buffer_u8) != 114) return tj_decode_uxchar(_start);
				if (buffer_peek(_src, _ofs++, buffer_u8) != 117) return tj_decode_uxchar(_start);
				if (buffer_peek(_src, _ofs++, buffer_u8) != 101) return tj_decode_uxchar(_start);
				tj_decode_offset = _ofs;
				return tj_true;
			case 102:
				_start = _ofs;
				if (buffer_peek(_src, _ofs++, buffer_u8) != 97) return tj_decode_uxchar(_start);
				if (buffer_peek(_src, _ofs++, buffer_u8) != 108) return tj_decode_uxchar(_start);
				if (buffer_peek(_src, _ofs++, buffer_u8) != 115) return tj_decode_uxchar(_start);
				if (buffer_peek(_src, _ofs++, buffer_u8) != 101) return tj_decode_uxchar(_start);
				tj_decode_offset = _ofs;
				return tj_false;
			case 110:
				_start = _ofs;
				if (buffer_peek(_src, _ofs++, buffer_u8) != 117) return tj_decode_uxchar(_start);
				if (buffer_peek(_src, _ofs++, buffer_u8) != 108) return tj_decode_uxchar(_start);
				if (buffer_peek(_src, _ofs++, buffer_u8) != 108) return tj_decode_uxchar(_start);
				tj_decode_offset = _ofs;
				return undefined;
			default:
				if (_c >= 48 && _c <= 57) {
					tj_decode_offset = _ofs;
					_num = tj_decode_number(_c);
					return _num;
				} else return tj_decode_uxchar(_ofs);
		}
	}
	tj_error_text = "Unexpected end of input at position " + string(_ofs) + ".";
	return tj_error;
}

function tj_decode_main(_json) {
	// tj_decode_main(json:string)->TjValue
	var _src = tj_source__new(_json);
	tj_decode_source = _src;
	tj_decode_offset = 0;
	tj_decode_length = buffer_get_size(_src) - 1;
	tj_error_text = "";
	var _val = tj_decode_value();
	if (tj_error_text == "") {
		var _ofs = tj_decode_offset;
		var _len = tj_decode_length;
		while (_ofs < _len) {
			switch (buffer_peek(_src, _ofs++, buffer_u8)) {
				case 9: case 10: case 13: case 32: continue;
			}
			tj_error_text = "Unexpected trailing data at position " + string(_ofs) + ".";
			_val = tj_error;
			break;
		}
	} else _val = tj_error;
	buffer_delete(tj_decode_source);
	return _val;
}

//}

//{ tj_encode

function tj_encode_string(_buf, _s) {
	// tj_encode_string(buf:buffer, s:string)
	buffer_write(_buf, buffer_u8, 34);
	var _n = string_length(_s);
	for (var _i = 1; _i <= _n; _i++) {
		var _uc = string_ord_at(_s, _i);
		switch (_uc) {
			case 34:
				buffer_write(_buf, buffer_u8, 92);
				buffer_write(_buf, buffer_u8, 34);
				break;
			case 92:
				buffer_write(_buf, buffer_u8, 92);
				buffer_write(_buf, buffer_u8, 92);
				break;
			case 9:
				buffer_write(_buf, buffer_u8, 92);
				buffer_write(_buf, buffer_u8, 116);
				break;
			case 13:
				buffer_write(_buf, buffer_u8, 92);
				buffer_write(_buf, buffer_u8, 114);
				break;
			case 10:
				buffer_write(_buf, buffer_u8, 92);
				buffer_write(_buf, buffer_u8, 110);
				break;
			case 8:
				buffer_write(_buf, buffer_u8, 92);
				buffer_write(_buf, buffer_u8, 98);
				break;
			case 12:
				buffer_write(_buf, buffer_u8, 92);
				buffer_write(_buf, buffer_u8, 102);
				break;
			default:
				if (_uc <= 127) {
					buffer_write(_buf, buffer_u8, _uc);
				} else if (_uc <= 2047) {
					buffer_write(_buf, buffer_u8, (192 | (_uc >> 6)));
					buffer_write(_buf, buffer_u8, (128 | (_uc & 63)));
				} else if (_uc <= 65535) {
					buffer_write(_buf, buffer_u8, (224 | (_uc >> 12)));
					buffer_write(_buf, buffer_u8, (128 | ((_uc >> 6) & 63)));
					buffer_write(_buf, buffer_u8, (128 | (_uc & 63)));
				} else {
					buffer_write(_buf, buffer_u8, (240 | (_uc >> 18)));
					buffer_write(_buf, buffer_u8, (128 | ((_uc >> 12) & 63)));
					buffer_write(_buf, buffer_u8, (128 | ((_uc >> 6) & 63)));
					buffer_write(_buf, buffer_u8, (128 | (_uc & 63)));
				}
		}
	}
	buffer_write(_buf, buffer_u8, 34);
}

function tj_encode_number(_buf, _v) {
	// tj_encode_number(buf:buffer, v:real)
	var _s = string_format(_v, 0, 15);
	var _n = string_pos(".", _s);
	if (_n > 0) {
		for (var _i = string_length(_s); _i > _n; _i--) {
			if (string_byte_at(_s, _i) != 48) {
				buffer_write(_buf, buffer_text, string_copy(_s, 1, _i));
				break;
			}
		}
		if (_i <= _n) buffer_write(_buf, buffer_text, string_copy(_s, 1, _n - 1));
	} else buffer_write(_buf, buffer_text, _s);
}

function tj_encode_value(_buf, _val, _indent, _tab) {
	// tj_encode_value(buf:buffer, val:TjValue, indent:string, tab:int)
	var _s, _i, _n, _t;
	if (is_string(_val)) {
		tj_encode_string(_buf, _val);
	} else if (is_bool(_val)) {
		buffer_write(_buf, buffer_text, (_val ? "true" : "false"));
	} else if (is_struct(_val)) {
		buffer_write(_buf, buffer_u8, 123);
		_tab++;
		var _keys = variable_struct_get_names(_val);
		_n = array_length(_keys);
		_i = -1;
		while (++_i < _n) {
			if (_i > 0) buffer_write(_buf, buffer_u8, 44);
			if (_indent != undefined) {
				if (_indent != "") {
					buffer_write(_buf, buffer_u8, 10);
					_t = _tab;
					while (--_t >= 0) {
						buffer_write(_buf, buffer_text, _indent);
					}
				} else buffer_write(_buf, buffer_u8, 32);
			}
			var _key = _keys[_i];
			if (tj_allow_value_keys) tj_encode_value(_buf, _key, _indent, _tab); else tj_encode_string(_buf, _key);
			buffer_write(_buf, buffer_u8, 58);
			if (_indent != undefined) buffer_write(_buf, buffer_u8, 32);
			tj_encode_value(_buf, variable_struct_get(_val, _keys[_i]), _indent, _tab);
		}
		_tab--;
		if (_indent != undefined) {
			if (_indent != "" && _n > 0) {
				buffer_write(_buf, buffer_u8, 10);
				_t = _tab;
				while (--_t >= 0) {
					buffer_write(_buf, buffer_text, _indent);
				}
			} else buffer_write(_buf, buffer_u8, 32);
		}
		buffer_write(_buf, buffer_u8, 125);
	} else if (is_array(_val)) {
		buffer_write(_buf, buffer_u8, 91);
		_tab++;
		_n = array_length(_val);
		for (_i = 0; _i < _n; _i++) {
			if (_i > 0) buffer_write(_buf, buffer_u8, 44);
			if (_indent != undefined) {
				if (_indent != "") {
					buffer_write(_buf, buffer_u8, 10);
					_t = _tab;
					while (--_t >= 0) {
						buffer_write(_buf, buffer_text, _indent);
					}
				} else buffer_write(_buf, buffer_u8, 32);
			}
			tj_encode_value(_buf, _val[_i], _indent, _tab);
		}
		_tab--;
		if (_indent != undefined) {
			if (_indent != "" && _n > 0) {
				buffer_write(_buf, buffer_u8, 10);
				_t = _tab;
				while (--_t >= 0) {
					buffer_write(_buf, buffer_text, _indent);
				}
			} else buffer_write(_buf, buffer_u8, 32);
		}
		buffer_write(_buf, buffer_u8, 93);
	} else if (_val == undefined) {
		buffer_write(_buf, buffer_text, "null");
	} else {
		var _num = tj_std_Std_parseFloat(_val);
		if (_num == _val) tj_encode_number(_buf, _num); else buffer_write(_buf, buffer_text, "null");
	}
}

function tj_encode_main(_val, _indent) {
	// tj_encode_main(val:TjValue, indent:string)->string
	var _buf = tj_encode_encode_buffer;
	buffer_seek(_buf, buffer_seek_start, 0);
	tj_encode_value(_buf, _val, _indent, 0);
	buffer_write(_buf, buffer_u8, 0);
	buffer_seek(_buf, buffer_seek_start, 0);
	return buffer_read(_buf, buffer_string);
}

//}

//{ tj

function tj_decode(_json) {
	/// tj_decode(json:string)->TjValue
	/// @param {string} json
	var _src = tj_source__new(_json);
	tj_decode_source = _src;
	tj_decode_offset = 0;
	tj_decode_length = buffer_get_size(_src) - 1;
	tj_error_text = "";
	var _val = tj_decode_value();
	if (tj_error_text == "") {
		var _ofs = tj_decode_offset;
		var _len = tj_decode_length;
		while (_ofs < _len) {
			switch (buffer_peek(_src, _ofs++, buffer_u8)) {
				case 9: case 10: case 13: case 32: continue;
			}
			tj_error_text = "Unexpected trailing data at position " + string(_ofs) + ".";
			_val = tj_error;
			break;
		}
	} else _val = tj_error;
	buffer_delete(tj_decode_source);
	return _val;
}

function tj_encode(_value, _indent) {
	/// tj_encode(value:TjValue, ?indent:string)->string
	/// @param {TjValue} value
	/// @param {string} [indent]
	if (false) throw argument[1];
	var _buf = tj_encode_encode_buffer;
	buffer_seek(_buf, buffer_seek_start, 0);
	tj_encode_value(_buf, _value, _indent, 0);
	buffer_write(_buf, buffer_u8, 0);
	buffer_seek(_buf, buffer_seek_start, 0);
	return buffer_read(_buf, buffer_string);
}

//}

//{ tj

function tj_opt_value_keys(_allow) {
	/// tj_opt_value_keys(?allow:bool)->bool
	/// @param {bool} [allow]
	if (false) throw argument[0];
	if (_allow != undefined) {
		tj_allow_value_keys = _allow;
		return _allow;
	} else return tj_allow_value_keys;
}

function tj_opt_ident_keys(_allow) {
	/// tj_opt_ident_keys(?allow:bool)->bool
	/// @param {bool} [allow]
	if (false) throw argument[0];
	if (_allow != undefined) {
		tj_allow_ident_keys = _allow;
		return _allow;
	} else return tj_allow_ident_keys;
}

//}

//{ tj.source

function tj_source__new(_s) {
	// tj_source__new(s:string)->TjSource
	var _n = string_byte_length(_s);
	var _this1 = buffer_create(_n + 1, buffer_grow, 1);
	var _sb = tj_source_sub_buf;
	if (buffer_get_size(_sb) < _n) buffer_resize(tj_source_sub_buf, _n);
	buffer_poke(_sb, 0, buffer_text, _s);
	buffer_copy(_sb, 0, _n, _this1, 0);
	return _this1;
}

function tj_source_sub(_this1, _pos, _len) {
	// tj_source_sub(this:buffer, pos:int, len:int)->string
	var _b = tj_source_sub_buf;
	if (buffer_get_size(_b) < _len + 1) buffer_resize(_b, _len + 1);
	buffer_copy(_this1, _pos, _len, _b, 0);
	buffer_poke(_b, _len, buffer_u8, 0);
	buffer_seek(_b, buffer_seek_start, 0);
	return buffer_read(_b, buffer_string);
}

//}

//{ tj

function tj_is_array(_q) {
	/// tj_is_array(q:dynamic)->bool
	/// @param {dynamic} q
	return is_array(_q);
}

function tj_is_object(_q) {
	/// tj_is_object(q:dynamic)->bool
	/// @param {dynamic} q
	return is_struct(_q);
}

function tj_magic_value(_v) {
	// tj_magic_value(v:TjValue)->TjValue
	return { tjMagic: _v }
}

function tj_bool(_v) {
	/// tj_bool(v:bool)->TjValue
	/// @param {bool} v
	if (_v) return tj_true; else return tj_false;
}

function tj_is_bool(_v) {
	/// tj_is_bool(v:TjValue)->bool
	/// @param {TjValue} v
	if (_v != tj_true) return _v == tj_false; else return true;
}

function tj_typeof(_q) {
	/// tj_typeof(q:TjValue)->string
	/// @param {TjValue} q
	var _r;
	if (is_struct(_q)) {
		_r = "object";
	} else if (is_array(_q)) {
		_r = "array";
	} else if (_q == tj_false || _q == tj_true) {
		_r = "boolean";
	} else if (is_string(_q)) {
		_r = "string";
	} else if (_q == tj_error) {
		_r = "error";
	} else if (_q == undefined) {
		_r = "undefined";
	} else if (tj_std_Std_parseFloat(_q) == _q) {
		_r = "number";
	} else _r = "unknown";
	return _r;
}

function tj_typeid(_q) {
	/// tj_typeid(q:TjValue)->string
	/// @param {TjValue} q
	var _r;
	if (is_struct(_q)) {
		_r = tj_type.object;
	} else if (is_array(_q)) {
		_r = tj_type.array;
	} else if (_q == tj_false || _q == tj_true) {
		_r = tj_type.boolean;
	} else if (is_string(_q)) {
		_r = tj_type.string;
	} else if (_q == tj_error) {
		_r = tj_type.error;
	} else if (_q == undefined) {
		_r = tj_type.null;
	} else if (tj_std_Std_parseFloat(_q) == _q) {
		_r = tj_type.number;
	} else _r = tj_type.unknown;
	return _r;
}

function tj_object(_key_value_pairs) {
	/// tj_object(...key_value_pairs:TjValue:TjValue)->TjValue
	/// @param ...key_value_pairs
	var _n = (argument_count >> 1);
	var _i;
	var _q = { }
	for (var _i = 0; _i < _n; _i += 2) {
		variable_struct_set(_q, argument[_i], argument[_i + 1]);
	}
	return _q;
}

function tj_array(_values) {
	/// tj_array(...values:TjValue:TjValue)->array<TjValue>
	/// @param ...values
	var _i = argument_count;
	var _r1 = undefined;
	_r1 = array_create(_i);
	while (--_i >= 0) {
		_r1[_i] = argument[_i];
	}
	return _r1;
}

function tj_get(_q, _key) {
	/// tj_get(q:TjValue, key:string)->TjValue
	/// @param {TjValue} q
	/// @param {string} key
	if (is_struct(_q)) return variable_struct_get(_q, _key); else throw tj_std_haxe_Exception_thrown(tj_std_Std_stringify(_q) + " is not an object.");
}

function tj_set(_q, _key, _val) {
	/// tj_set(q:TjValue, key:string, val:TjValue)
	/// @param {TjValue} q
	/// @param {string} key
	/// @param {TjValue} val
	if (is_struct(_q)) variable_struct_set(_q, _key, _val); else throw tj_std_haxe_Exception_thrown(tj_std_Std_stringify(_q) + " is not an object.");
}

function tj_delete(_q, _key) {
	/// tj_delete(q:TjValue, key:string)
	/// @param {TjValue} q
	/// @param {string} key
	if (is_struct(_q)) variable_struct_set(_q, _key, undefined); else throw tj_std_haxe_Exception_thrown(tj_std_Std_stringify(_q) + " is not an object.");
}

function tj_size(_q) {
	/// tj_size(q:TjValue)->int
	/// @param {TjValue} q
	if (is_struct(_q)) return variable_struct_names_count(_q); else return 0;
}

function tj_keys(_q) {
	/// tj_keys(q:TjValue)->array<string>
	/// @param {TjValue} q
	if (is_struct(_q)) {
		return variable_struct_get_names(_q);
	} else {
		var _r = undefined;
		_r = array_create(0);
		return _r;
	}
}

function tj_compare(_a, _b) {
	/// tj_compare(a:TjValue, b:TjValue)->bool
	/// @param {TjValue} a
	/// @param {TjValue} b
	var _i, _n;
	if (is_struct(_a)) {
		if (!is_struct(_b)) return false;
		if (variable_struct_names_count(_a) != variable_struct_names_count(_b)) return false;
		var _keys = variable_struct_get_names(_a);
		_n = array_length(_keys);
		_i = -1;
		while (++_i < _n) {
			var _key = _keys[_i];
			var _bv = variable_struct_get(_b, _key);
			if (_bv == undefined && !variable_struct_exists(_bv, _key)) return false;
			if (!tj_compare(variable_struct_get(_a, _key), _bv)) return false;
		}
		return true;
	} else if (is_array(_a)) {
		if (!is_array(_b)) return false;
		_n = array_length(_a);
		if (array_length(_b) != _n) return false;
		_i = -1;
		while (++_i < _n) {
			if (!tj_compare(_a[_i], _b[_i])) return false;
		}
		return true;
	}
	return _a == _b;
}

function tj_copy(_val) {
	/// tj_copy(val:TjValue)->TjValue
	/// @param {TjValue} val
	var _i, _n, _out;
	if (is_struct(_val)) {
		var _keys = variable_struct_get_names(_val);
		_n = array_length(_keys);
		_out = { }
		_i = -1;
		while (++_i < _n) {
			var _key = _keys[_i];
			variable_struct_set(_out, _key, tj_copy(variable_struct_get(_val, _key)));
		}
		return _out;
	} else if (is_array(_val)) {
		_n = array_length(_val);
		_out = array_create(_n);
		_i = -1;
		while (++_i < _n) {
			_out[@_i] = tj_copy(_val[_i]);
		}
		return _out;
	} else return _val;
}

//}

//{ tj_std.haxe.Exception

function tj_std_haxe_Exception_thrown(_value) {
	// tj_std_haxe_Exception_thrown(value:any)->any
	if (is_struct(_value) && variable_struct_get(_value, "__exception__") == true) return _value;
	return {
		value: _value,
		message: string(_value),
		longMessage: "",
		script: "",
		stacktrace: debug_get_callstack(),
		__exception__: true
	}
}

//}

// tj_decode:
globalvar tj_decode_source;
globalvar tj_decode_offset;
globalvar tj_decode_length;
globalvar tj_decode_esc; tj_decode_esc = 92;
globalvar tj_decode_string_buf; tj_decode_string_buf = buffer_create(1024, buffer_grow, 1);
globalvar tj_decode_list_pool; tj_decode_list_pool = ds_list_create();
// tj_encode:
globalvar tj_encode_encode_buffer; tj_encode_encode_buffer = buffer_create(1024, buffer_grow, 1);
// tj:
globalvar tj_error_text;
// tj:
globalvar tj_allow_value_keys; tj_allow_value_keys = false;
globalvar tj_allow_ident_keys; tj_allow_ident_keys = false;
// tj.source:
globalvar tj_source_sub_buf; tj_source_sub_buf = buffer_create(256, buffer_fixed, 1);
// tj:
globalvar tj_true; tj_true = bool(true);
globalvar tj_false; tj_false = bool(false);
globalvar tj_error; tj_error = tj_magic_value("tj_error");
globalvar tj_null; tj_null = undefined;
globalvar tj_object_buf; tj_object_buf = buffer_create(1024, buffer_grow, 1);

