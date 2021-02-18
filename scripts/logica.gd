extends Node2D
var moneda = false
var guiso = false
var hueso = false
var estadonpc1 = 0
var estadonpc2 = 0
var estadonpc3 = 0
var estadonpc4 = 0
var estadonpc5 = 0
var tengop2 = 0
var day =1

func npc_talk(id):
	################################ NPC 1 ####################################################3
	if id ==1:
		if estadonpc1 ==0:
			return {
				'textos':[{'texto':'¡Eh, ameo! ¿No tendrá una monedita para este pobre linyera al que la desgracia mancilló su suerte?','id':1}],
				 'opcion1':{'texto':'Ser forro', 'valor':1,
						  'selected':[
						{'texto':'Rajá de acá linyera sucio, andá a lavarte las patas.','id':0}
						]},
				 'opcion2':{'texto':'Buscar en los bolsillos', 'valor':2, 'selected':[{'texto':'NO ENCONTRASTE NADA EN TUS BOLSILLOS. CONTINÚA TU CAMINO.','id':6}]}
				}
		if estadonpc1 == 1:
			pass
		if estadonpc1 == 2:
			if moneda and not guiso:
				return {
					'textos':[{'texto':'¡Hola de nuevo, mi querido amigo! ¿Ha encontrado algo para este pobre linyera al cual la bonanza ha tratado tan pobremente?','id':1}],
					 'opcion1':{'texto':'Ser forro', 'valor':'1','selected':[{'texto':'Rajá de acá linyera sucio, no me jodas.','id':1}]},
					 'opcion2':{'texto':'Dar moneda', 'valor':'3','selected':[{'texto':'¡Muchas gracias mi Lord de la opulencia! Cuente conmigo para lo que necesite.','id':1}, {'texto':'Desde hoy puede llamarme su amigo.','id':1}]}
					}
			if guiso and not moneda:
				return {
					'textos':[{'texto':'¡Hola mi tan agraciado compañero! ¿No le sobrará algo pal’ diente?','id':1}],
					 'opcion1':{'texto':'ser forro', 'valor':'1','selected':[{'texto':'Rajá de acá linyera sucio, tenés olor a culo.','id':1}]},
					 'opcion2':{'texto':'Entregar cacho de carne', 'valor':'4','selected':[{'texto':'¡Muchas gracias mi comandante del atracón! Es usted un alma sensible y caritativa.','id':1},{'texto':' Cuénteme entre sus amigos y por favor tome este hueso que con tanto ahínco he limpiado de todo tuétano para usted.','id':1},{'texto':'HAS ADQUIRIDO: HUESO','id':6}]}
					}
			if guiso and moneda:
				return {
					'textos':[{'texto':'¡Hola mi señor de los bosques! ¿Por casualidad no tendrá una monedita para alivianar mi pesar o un pedazo de comida para este estómago tan castigado?','id':1}],
					 'opcion1':{'texto':'Entregar moneda', 'valor':'3','selected':[{'texto':'¡Muchas gracias mi Lord de la opulencia! Cuente conmigo para lo que necesite.','id':1}]},
					 'opcion2':{'texto':'Entregar cacho de carne', 'valor':'4','selected':[{'texto':'¡Muchas gracias mi comandante del atracón! Es usted un alma sensible y caritativa.','id':1},{'texto':' Cuénteme entre sus amigos y por favor tome este hueso que con tanto ahínco he limpiado de todo tuétano para usted.','id':1},{'texto':'HAS ADQUIRIDO: HUESO','id':6}]}
					}
			return {
				'textos':[{'texto':'¡Eh, ameo! ¿No tendrá una monedita para este pobre linyera al que la desgracia mancilló su suerte?','id':1}],
				 'opcion1':{'texto':'Ser forro', 'valor':1,
						  'selected':[
						{'texto':'Rajá de acá linyera sucio, andá a lavarte las patas.','id':0}
						]},
				 'opcion2':{'texto':'Buscar en los bolsillos', 'valor':2, 'selected':[{'texto':'NO ENCONTRASTE NADA EN TUS BOLSILLOS. CONTINÚA TU CAMINO.','id':6}]}
				}					
	################################ NPC 2 ####################################################3
	if id ==2:
		if estadonpc2 ==0:
			return {
					  "textos": [
						{
						  "texto": "¡Ey vos, cabeza de fósforo, vení para acá! No me gusta tu cara ni esa túnica de mierda. Tenés cara de pelotudo y seguro que un poquito de olor a culo. Rajá de acá antes de que te cague a trompadas.",
						  "id": 2
						}
					  ],
					  "opcion1": {
						"texto": "Ser forro también.",
						"valor": 1,
						"selected": [
						  {
							"texto": "Buenos insultos, dignos de un nene de 12. Como lo veo yo caben dos posibilidades, o bien a tus viejos se les olvidó ponerle barandas a la cuna o bien no te abrazaron lo suficiente. Haceme el favor de  hacer el bucket challenge con ácido, forro.",
							"id": 6
						  }
						]
					  },
					  "opcion2": {
						"texto": "Ser amable.",
						"valor": 3,
						"selected": [
						  {
							"texto": "Veo que hay mucha hostilidad dentro tuyo. Creo no haberte ofendido de forma alguna como para haberme ganado tu rencor de manera que respetuosamente voy a pedirte que por favor disminuyas el nivel de agresividad ¡No seas gil y tomate el palo con esa mala onda, guacho!",
							"id": 6
						  },
						  {
							"texto": "…\nDisculpá viejo, posta. Ando con algunos quilombitos. En alguna otra ocasión te contaré mejor. Sos la primera persona que me trata con respeto en mucho tiempo, ¿sabés? ¿Andás con hambre? a mí me sobró este cacho de carne de ayer, vo fijate.\n\n¡HAS CONSEGUIDO UN CACHO DE CARNE!",
							"id": 0
						  }
						]
					  }
					}
		if estadonpc2 == 3:
			return {
					  "textos": [
						{
						  "texto": "Disculpá por cómo te traté hace un rato, pibe. Vos sabés que desde hace un tiempo ya ando con un problemita de ira contenida. comenzó hace mucho tiempo ya, cuando guachín. Mi mamá comenzaba a salir con un nuevo novio y yo no la estaba pasando bien en la escuela, cuando me di cuenta de que…",
						  "id": 2
						}
					  ],
					  "opcion1": {
						"texto": "Seguir escuchando.",
						"valor": 8,
						"selected": [
						  {
							"texto": "PONÉS CARA DE NADA Y DEJÁS QUE TERMINE SU HISTORIA. NADA RELEVANTE PARA CONTAR, CREEME.",
							"id": 6
						  }
						]
					  },
					  "opcion2": {
						"texto": "No escucharlo.",
						"valor": 1,
						"selected": [
						  {
							"texto": "UNA MUECA ENTRECORTADA SE DIBUJA EN SU CARA Y UN QUEJIDO AHOGADO AVECINA EL INEVITABLE LLANTO. LENTO PERO CON PASO FIRME TE ALEJÁS DE ESTE PERSONAJE TAN ODIOSO MIENTRAS QUE POR UNA EXTRAÑA RAZÓN RECORDÁS LA ÚNICA VEZ QUE VISTE A TU PADRE LLORAR. \nSEGUÍS TU CAMINO.",
							"id": 6
						  }
						]
					  }
					}
		if estadonpc2 == 1:
			pass
		if estadonpc2 == 8:
			return {
					  "textos": [
						{
						  "texto": "¡Hola troesma! Te quería seguir contando un poco más sobre mi sufrida vida, resulta que tuve una novia que... ",
						  "id": 2
						}
					  ],
					  "opcion1": {
						"texto": "Seguir escuchando",
						"valor": 5,
						"selected": [
						  {
							"texto": "INTENTÁS MANTENER LA ATENCIÓN SIN QUEDARTE DORMIDO PERO SE TE HACE CADA VEZ MÁS DIFÍCIL. INVENTÁS UNA EXCUSA MAL ELABORADA Y SEGUÍS TU CAMINO.",
							"id": 6
						  }
						]
					  },
					  "opcion2": {
						"texto": "Mandarlo a la mierda",
						"valor": 1,
						"selected": [
						  {
							"texto": "Disculpá que te interrumpa, flaco, pero me cansaste. Dejá de culpar al resto y hacete cargo, gil.\n",
							"id": 0
						  },
						  {
							"texto": "UNA MUECA ENTRECORTADA SE DIBUJA EN SU CARA Y UN QUEJIDO AHOGADO AVECINA EL INEVITABLE LLANTO. LENTO PERO CON PASO FIRME TE ALEJÁS DE ESTE PERSONAJE MIENTRAS QUE POR UNA EXTRAÑA RAZÓN RECORDÁS LA ÚNICA VEZ QUE VISTE A TU PADRE LLORAR. \nSEGUÍS TU CAMINO.",
							"id": 6
						  }
						]
					  }
					}

		if estadonpc2 == 5:
			return {
					  "textos": [
						{
						  "texto": "¡Hola otra vez! Qué bueno verte otra vez. Te quería seguir contando sobre la vez en la que…",
						  "id": 2
						},
						{
						  "texto": "Uf...",
						  "id": 0	
						},
						{
						  "texto": "¿Qué?",
						  "id": 2
						},
						{
						  "texto": "Nada, nada. vamos al grano, ¿con qué necesitás ayuda?",
						  "id": 0
						},
						{
						  "texto": "Te quería pedir ayuda. Más adelante hay una chica que es el amor de mi vida.",
						  "id": 2
						},
						{
						  "texto": "¿Mi vieja? Rescatate...",
						  "id": 0
						},
						{
						  "texto": "No, no. La de azul. Te quería pedir un consejo para poder hablar con ella.",
						  "id": 2
						}
					  ],
					  "opcion1": {
						"texto": "Engañarla.",
						"valor": 5,
						"selected": [
						  {
							"texto": "Tengo una idea. Me dio la impresión de que la muchacha es comunista. Vos decile que sos un revolucionario bárbaro que va a estar todo bien.",
							"id": 0
						  }
						]
					  },
					  "opcion2": {
						"texto": "Abrir tu corazón.",
						"valor": 1,
						"selected": [
						  {
							"texto": "Disculpá que te interrumpa, flaco, pero me cansaste. Dejá de culpar al resto y hacete cargo, gil.\n",
							"id": 0
						  },
						  {
							"texto": "Yo creo que lo mejor que podés hacer es ir de frente y sin rodeos y contarle lo que te pasa. A no joder con lo que uno siente, che.",
							"id": 0
						  }
						]
					  }
					}

			pass			
		################################ NPC 3 ####################################################3
	if id ==3:
		if estadonpc3 ==0:
			return {
				'textos':[{'texto':'¡GUAU! ¡GUAU!','id':3}, {'texto':'Sí, lo entiendo, yo también estoy preocupado por la situación socio-política de Sri Lanka.','id':0}],
				 'opcion1':{'texto':'Jugar', 'valor':2,
						  'selected':[
						{'texto':'ENCONTRÁS UN TRONCO GIGANTE A LA VERA DEL CAMINO. LO PATEÁS PERO AUNQUE NO SE MUEVA ÉL SE OCUPA DE TOMARLO Y ENTRETENERSE UN RATO. HAS GANADO UN POCO DE SU CONFIANZA.','id':6}
						]},
				 'opcion2':{'texto':'No jugar', 'valor':0, 'selected':[
						{'texto':'Grrrrr ¡GUAU!','id':3},
						{'texto':'¡Pará, ortiva! ¡Rescatate!','id':0},
						{'texto':'SEGUÍS TU CAMINO.','id':6}
				]}
				}
		if estadonpc3 == 1:
			pass
		if estadonpc3 == 2:
			return {
				'textos':[{'texto':'¡WOF! ¡WOF!','id':3}, {'texto':'¡Epa! Opiniones fuertes, yo adoptaría una posición más diplomática para la situación en Medio Oriente.','id':0}],
				 'opcion1':{'texto':'Acariciar', 'valor':3,
						  'selected':[
						{'texto':'TE PONÉS EN PUNTAS DE PIE Y ACARICIÁS SU PANZA. CLARAMENTE HAS GANADO SU CONFIANZA. SEGUÍS TU CAMINO.','id':6}
						]},
				 'opcion2':{'texto':'No acariciar.', 'valor':2, 'selected':[
						{'texto':'Grrrr ¡GUAU! ¡GUAU!','id':3},
						{'texto':'¡Aguantá, rope facho! Hay que bancarse todas las religiones, podrías haber sido muy hiriente.','id':0},
						{'texto':'SEGUÍS TU CAMINO.','id':6}
				]}
				}
		if estadonpc3 == 3 and not hueso:
			return {
				'textos':[{'texto':'¡GUAU! ¡GUAU!','id':3}, {'texto':'Mirá, me pone un poco incómodo tratar el tema de mi sexualidad con alguien a quien apenas conozco pero si querés en alguna otra ocasión lo charlamos.','id':0}],
				 'opcion1':{'texto':'Acariciar', 'valor':3,
						  'selected':[
						{'texto':'TE PONÉS EN PUNTAS DE PIE Y ACARICIÁS SU PANZA. CLARAMENTE HAS GANADO SU CONFIANZA. SEGUÍS TU CAMINO.','id':6}
						]},
				 'opcion2':{'texto':'Patear', 'valor':1, 'selected':[
						{'texto':'CON TODAS TUS FUERZAS LOGRÁS GOLPEAR EL COSTADO DE SU PATA. OFENDIDO TE MIRA CON GANAS DE COMERTE PERO POR SUERTE SOLO MURMURA ALGO DE CARÁCTER ANTISEMITA Y DEJA DE HABLARTE. SEGUÍS TU CAMINO.','id':6}
				]}
				}
		if estadonpc3 == 3 and hueso:
			return {
				'textos':[{'texto':'¡GUAU! ¡GUAU!','id':3}, {'texto':'No veo qué relación tendrían pero yo que vos tendría cuidado con a quién le expresás esas opiniones.','id':0}],
				 'opcion1':{'texto':'Dar hueso', 'valor':4,
						  'selected':[
						{'texto':'ALEGREMENTE TOMA TU REGALO Y LO DEVORA DE UN BOCADO. HAS GANADO UN NUEVO E INCONDICIONAL AMIGO AUNQUE DE IDEAS ALGO OPRESIVAS Y DESPÓTICAS. SEGUÍS TU CAMINO.','id':6}
						]},
				 'opcion2':{'texto':'Patear', 'valor':1, 'selected':[
						{'texto':'CON TODAS TUS FUERZAS LOGRÁS GOLPEAR EL COSTADO DE SU PATA. OFENDIDO TE MIRA CON GANAS DE COMERTE PERO POR SUERTE SOLO MURMURA ALGO DE CARÁCTER ANTISEMITA Y DEJA DE HABLARTE. SEGUÍS TU CAMINO.','id':6}
				]}
				}		
		################################ NPC 4 ####################################################3
	if id ==4:
		if estadonpc4 ==0:
			return {
					  "textos": [
						{
						  "texto": "¡Hola camarada! un fantasma recorre este valle, es el fantasma del comunismo. Todas las fuerzas se han unido en santa cruzada para acosar ese fantasma. Las masas debemos unirnos para pelear por nuestros derechos. ¿Qué decís, te vas a unir en la lucha contra la opresión?\n",
						  "id": 4
						}
					  ],
					  "opcion1": {
						"texto": "Rechazar ",
						"valor": 2,
						"selected": [
						  {
							"texto": "¿De qué masas me estás hablando, flaca? Si somos seis adentro del jueguito. Andá a comprarte unas masas de confitería, alegrate la vida y no me jodas.",
							"id": 0
						  },
						  {
							"texto": "Veo que tu falsa conciencia de clase te ha convertido en un cerdo capitalista. Cortá de acá, ortiva.",
							"id": 4
						  },
						  {
							"texto": "SEGUÍS TU CAMINO.",
							"id": 6
						  }
						]
					  },
					  "opcion2": {
						"texto": "Aceptar.",
						"valor": 3,
						"selected": [
						  {
							"texto": "Creo que tu lucha es noble y tus preocupaciones sinceras. Hablemos de esto en otra ocasión.",
							"id": 0
						  },
						  {
							"texto": "¡Eso es! Serás una valiosa adquisición. Tomá esta moneda y fijate si podés conseguir un fusil para cuando caiga la revolución.",
							"id": 4
						  },
						  {
							"texto": "AGARRÁS LA MONEDA PERO NO ESTÁS MUY CONVENCIDO DE UTILIZARLA EN LOS FINES PROPUESTOS.\n\n¡HAS ADQUIRIDO UNA MONEDA!",
							"id": 6
						  }
						]
					  }
					}

		if estadonpc4 == 6:
			return {
					  "textos": [
						{
						  "texto": "¿Listo para liberar nuestro imaginario mundo de su ruin y repugnante yugo clasista?",
						  "id": 4
						}
					  ],
					  "opcion1": {
						"texto": "Rechazar ",
						"valor": 2,
						"selected": [
						  {
							"texto": "El yugo lo tenés en la cabeza, flaca. Cortá de acá.",
							"id": 0
						  },
						  {
							"texto": "Veo que tu falsa conciencia de clase te ha convertido en un cerdo capitalista, ortiva.\n",
							"id": 4
						  },
						  {
							"texto": "SEGUÍS TU CAMINO",
							"id": 6
						  }
						]
					  },
					  "opcion2": {
						"texto": "El amor es el camino",
						"valor": 7,
						"selected": [
						  {
							"texto": "¿No piensa usted, señorita, que haría bien en pensar en la compañía de un muchacho, muchacha, muchache, muchachi o muchachu antes que en la revolución?",
							"id": 0
						  },
						  {
							"texto": "No… pero lo voy a considerar.",
							"id": 4
						  }
						]
					  }
					}
		if estadonpc4 == 7:
			return {
				  "textos": [
					{
					  "texto": "¡Compañero en la revolución, nuevamente por aquí! Ya consiguió ese fusil del que le hablé?",
					  "id": 4
					}
				  ],
				  "opcion1": {
					"texto": "El amor sigue siendo el camino",
					"valor": 8,
					"selected": [
					  {
						"texto": "¿No cree usted, camarada, que así como la Frida guampeó al Dieguito con el León todos merecemos una chance de querer? Voy a ver si le consigo un candidato (a/e/i/u)?",
						"id": 0
					  }
					]
				  },
				  "opcion2": {
					"texto": "Ayudar.",
					"valor": 9,
					"selected": [
					  {
						"texto": "Estaban caros los fusiles pero la próxima lo charlamos mejor, ahora ando medio apurado.",
						"id": 0
					  }
					]
				  }
				}
		if estadonpc4 == 8:
			return {
					  "textos": [
						{
						  "texto": "Bueno, no sea diletante mi compañero en armas y présteme una mano para acabar de una vez por todas con los traidores de la clase obrera.",
						  "id": 4
						},
						{
						  "texto": "De hecho le tengo otra propuesta.",
						  "id": 0
						}
					  ],
					  "opcion1": {
						"texto": "Engañar.",
						"valor": 530,
						"selected": [
						  {
							"texto": "HAS CONSEGUIDO ENGAÑAR DOS PERSONAJES. NI ÉL ES REVOLUCIONARIO NI ELLA ESTÁ MUY CONVENCIDA. A VECES LAS RELACIONES NO SON TODO LO QUE ESPERABAMOS.",
							"id": 6
						  }
						]
					  },
					  "opcion2": {
						"texto": "Ayudar.",
						"valor": 9,
						"selected": [
						  {
							"texto": "Estaban caros los fusiles pero la próxima lo charlamos mejor, ahora ando medio apurado.",
							"id": 0
						  }
						]
					  }
					}
		if estadonpc4 == 10:
			return{
				  "textos": [
					{
					  "texto": "Bueno, no sea diletante mi compañero en armas y présteme una mano para acabar de una vez por todas con los traidores de la clase obrera.",
					  "id": 4
					},
					{
					  "texto": "De hecho le tengo otra propuesta.",
					  "id": 0
					}
				  ],
				  "opcion1": {
					"texto": "Llamar pretendiente.",
					"valor": 530,
					"selected": [
					  {
						"texto": "SOS TESTIGO DE UNA DE LAS MÁS BELLAS DECLARACIONES DE AMOR JAMÁS VISTAS. LAMENTABLEMENTE EN EL CORAZÓN DE LA MUCHACHA SOLO CABEN DESEOS REVOLUCIONARIOS.\nAUNQUE CON EL CORAZÓN ROTO ÉL TE ESTÁ AGRADECIDO. HAS GANADO UN AMIGO.",
						"id": 6
					  }
					]
				  },
				  "opcion2": {
					"texto": "Ayudar.",
					"valor": 9,
					"selected": [
					  {
						"texto": "Estaban caros los fusiles pero la próxima lo charlamos mejor, ahora ando medio apurado.",
						"id": 0
					  }
					]
				  }
				}

		if estadonpc4 == 9:
			return	{
			  "textos": [
				{
				  "texto": "¡Camarada! No nos demoremos más, es tiempo de revolución en esta tierra castigada por la injusticia. Aquí tiene su fusil.",
				  "id": 4
				},
				{
				  "texto": "HAS OBTENIDO UN FUSIL.",
				  "id": 6
				},
				{
				  "texto": "¿Por donde desea comenzar?",
				  "id": 4
				}
			  ],
			  "opcion1": {
				"texto": "Desestabilizar el sistema financiero capitalista.",
				"valor": 3,
				"selected": [
				  {
					"texto": "DLC \"AKAMAI - UFO REVENGE\" NOT FOUND.",
					"id": 6
				  }
				]
			  },
			  "opcion2": {
				"texto": "Tomar el gobierno y establecer un sistema de comunas.",
				"valor": 3,
				"selected": [
				  {
					"texto": "DLC \" AKAMAI - UFO REVENGE\" NOT FOUND.",
					"id": 6
				  }
				]
			  }
			}

		if estadonpc4 == 12:
			return {
			  "textos": [
				{
				  "texto": "¿Listo para liberar nuestro imaginario mundo de su ruin y repugnante yugo clasista?",
				  "id": 4
				}
			  ],
			  "opcion1": {
				"texto": "Rechazar.",
				"valor": 530,
				"selected": [
				  {
					"texto": "El yugo lo tenés en la cabeza, flaca. Cortá de acá.",
					"id": 0
				  },
				  {
					"texto": "Veo que tu falsa conciencia de clase te ha convertido en un cerdo capitalista, ortiva.",
					"id": 4
				  },
				  {
					"texto": "SEGUÍS TU CAMINO.",
					"id": 6
				  }
				]
			  },
			  "opcion2": {
				"texto": "Ayudar.",
				"valor": 9,
				"selected": [
				  {
					"texto": "Estaban caros los fusiles pero la próxima lo charlamos mejor, ahora ando medio apurado.",
					"id": 4
				  }
				]
			  }
			}

		
		################################ NPC 5 ####################################################3
	if id ==5:
		if estadonpc5 ==0:
			return {
				'textos':[{'texto':'¡Hola hijo! Abrigate el cuello que está fresco. ¿Viste el linyera sucio que está al principio del nivel? No te juntes con esa gente, me da mala espina.','id':5}],
				 'opcion1':{'texto':'Estar de acuerdo.', 'valor':2,
						  'selected':[
						{'texto':'LE DAS LA RAZÓN. AL FINAL SOS UN NENE DE MAMÁ. SEGUÍ TU CAMINO DE PREJUICIOS Y NO ME HAGÁS HABLAR, MIRÁ. ','id':6}
						]},
				 'opcion2':{'texto':'Ignorar.', 'valor':3, 'selected':[
						{'texto':'PONÉS CARA DE INDIFERENCIA Y SEGUÍS TU CAMINO.','id':6}
				]}
				}
		if estadonpc5 == 2:
			return {
				'textos':[{'texto':'¿Otra vez acá, hijo? Decime que no te pusiste a hablar con ese muchacho sin casa y que tampoco le prestaste atención a esa chica con ideas raras. Vos mejor no te metas en esos temas extraños, querido. De política no se habla.','id':5}],
				 'opcion1':{'texto':'Estar de acuerdo.', 'valor':13,
						  'selected':[
						{'texto':'LE DAS LA RAZÓN A TU MADRE. NO APRENDÉS MÁS, PIBE. ¿DE PENSAR POR VOS MISMO NI HABLAR, NO? ','id':6}
						]},
				 'opcion2':{'texto':'Ignorar.', 'valor':13, 'selected':[
						{'texto':'TRAGÁS SALIVA ANTE LOS COMENTARIOS Y SEGUÍS TU CAMINO. NO VALE LA PENA PONERSE A PELEAR POR CADA COMENTARIO.','id':6}
				]}
				}
		if estadonpc5 == 13:
			return {
				'textos':[{'texto':'¡Hola hijo! Decime que te pusiste a hablar con ese perro a mitad del camino. A vos te podrían ayudar algunas de esas ideas fuertes que tiene.','id':5}],
				 'opcion1':{'texto':'Estar de acuerdo.', 'valor':5,
						  'selected':[
						{'texto':'TU VIEJA ESTÁ EQUIVOCADA Y VOS TAMBIÉN, OBSECUENTE DE CUARTA. FELICITACIONES, SOS FACHO.','id':6}
						]},
				 'opcion2':{'texto':'Enfrentar.', 'valor':10, 'selected':[
						{'texto':'FINALMENTE, VIEJO. ESTABA ESPERANDO QUE HAGAS VALER TU OPINIÓN Y NO DESILUCIONASTE. TARDE PERO SEGURO TE CRECIERON UN PAR DE HUEVOS.','id':6}
				]}
				}
		if estadonpc5 == 3:
			return {
				'textos':[{'texto':'¿Otra vez acá, hijo? Decime que no te pusiste a hablar con ese muchacho sin casa y que tampoco le prestaste atención a esa chica con ideas raras. Vos mejor no te metas en esos temas extraños, querido. De política no se habla.','id':5}],
				 'opcion1':{'texto':'Darle la razón', 'valor':8,
						  'selected':[
						{'texto':'LE DAS LA RAZÓN. AL FINAL SOS UN NENE DE MAMÁ. SEGUÍ TU CAMINO DE PREJUICIOS Y NO ME HAGÁS HABLAR, MIRÁ. ','id':6}
						]},
				 'opcion2':{'texto':'Ignorar.', 'valor':8, 'selected':[
						{'texto':'TRAGÁS SALIVA ANTE LOS COMENTARIOS Y SEGUÍS TU CAMINO. TAMPOCO NOS VAMOS A PONER A PELEAR CON LA VIEJA.','id':6}
				]}
				}				
		if estadonpc5 == 8:
			return {
				'textos':[{'texto':'¡Hola hijo! Decime que te pusiste a hablar con ese perro a mitad del camino. A vos te podrían ayudar algunas de esas ideas fuertes que tiene.','id':5}],
				 'opcion1':{'texto':'Darle la razón', 'valor':9,
						  'selected':[
						{'texto':'AL FINAL SOS UN OBSECUENTE DE CUARTA. TU VIEJA ESTÁ EQUIVOCADA Y VOS TAMBIÉN, FELICITACIONES.','id':6}
						]},
				 'opcion2':{'texto':'Enfrentar.', 'valor':10, 'selected':[
						{'texto':'LISTO. MAMÁ TE LLENÓ LOS HUEVOS, LO QUE NO ESTÁ MAL PERO… Y AHORA QUÉ HACEMOS?','id':6}
				]}
				}				
		if estadonpc5 == 10:
			return {
				'textos':[{'texto':'LISTO. MAMÁ TE LLENÓ LOS HUEVOS, LO QUE NO ESTÁ MAL PERO… Y AHORA QUÉ HACEMOS?','id':6}],
				 'opcion1':{'texto':'Abandonar madre', 'valor':11,
						  'selected':[
						{'texto':'SE VE QUE ALGUNOS PENSAMIENTOS SON IRRECONCILIABLES. LA BESÁS EN LA FRENTE, LE DECÍS QUE LA QUERÉS PERO NO TE LA FUMÁS MÁS Y ADIÓS MAMÁ.','id':6}
						]},
				 'opcion2':{'texto':'Intentar charlar el problema.', 'valor':12, 'selected':[
						{'texto':'TE SENTÁS A TOMAR UNOS MATES CON LA VIEJA. TE DAS CUENTA DE QUE CRECIERON EN MOMENTOS HISTÓRICOS DIFERENTES Y EN ÚLTIMA INSTANCIA NO DA PELEARSE CON LA FAMILIA. AMBOS HACEN LA PROMESA DE SER MÁS TOLERANTES CON LOS DESEOS DEL OTRO. HABLANDO LAS COSAS SE RESUELVEN, CHE.','id':6}
				]}
				}		
					
		
func npc_set_state(id,estado):
	estado=int(estado)
	if id ==1:
		if estado == 4:
			hueso = true
		estadonpc1 = estado
	if id ==2:
		if estado ==3:
			guiso = true
		estadonpc2 = estado
	if id ==3:
		estadonpc3 = estado
	if id ==4:
		if estado == 3:
			moneda = true
			if tengop2 == 0:
				estado = 12
			else:
				estado = 6
		estadonpc4 = estado
	if id ==5:
		estadonpc5 = estado


