#include <stdio.h>
#include <stdlib.h>
#include <GL/glut.h>

void initGL(void);
void draw(void);
void reshape(int width, int height);
void idle(void);
//#include <GL/gl.h>
//#include <GL/glu.h>

int main(int argc, char *argv[])
{
	glutInit(&argc, argv);  //
	glutInitDisplayMode(GLUT_RGB | GLUT_SINGLE);//nuestros pixeles va ser RGB  
	glutInitWindowSize(800, 600);
	glutInitWindowPosition(10, 10);
	glutCreateWindow("Hola OpenGL");
	glutDisplayFunc(draw);//puntero a funcion draw
	glutreshapeFunc(reshape);//puntero a funcion draw
	glutIdleFunc(idle);
	initGl();
	glutMainLoop();
	return 0;
}


void initGL(void)
{
	glClearColor(0.0, 0.0, 0.0, 0.0);//siempre se pasan los los 4 parametro aun q usemos el RGB
}


void draw(void)
{

}

void reshape(int width, int heigth)
{

}


void idle(void)
{
	glutPostRedisplay();
}