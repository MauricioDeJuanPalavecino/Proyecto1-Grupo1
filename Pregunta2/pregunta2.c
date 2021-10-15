#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "pregunta2.h"

int x = 0;
int y = 0;

struct ast * newast(int nodetype) {

    struct ast *a = malloc(sizeof(struct ast));
    if(!a) {
    
        yyerror("out of space");
        exit(0);
    }
    a->nodetype = nodetype;
    return a;
}

struct ast * newnum(char c){
    struct numval *a = malloc(sizeof(struct numval));
    if(!a) {
        yyerror("out of space");
        exit(0);
    }
    a->nodetype = 'K';
    return (struct ast *)a;
}


char eval(struct ast *a) {
  char v; //calculated value of this subtree
  
  switch(a->nodetype) {
    case 'K': v = ((struct numval *)a)->cardial; break;
    case  'A' : v = eval(a->r); break;
    case  'B' : v = eval(a->r); break;
    case  'C' : v = eval(a->r); break;
    case  'D' : v = eval(a->r); break;
    default: printf("internal error: bad node %c\n", a->nodetype); }
  return v;
}


void printtree( struct ast *a ){
  switch(a->nodetype) {
    /* no subtree */
    case 'K': printf("hoja=%f\n",((struct numval *)a)->cardial);
    break;
    case 'A': printf("nodo=%c\n",a->nodetype); printtree(a->l);
    case 'B': printf("nodo=%c\n",a->nodetype); printtree(a->l);
    case 'C': printf("nodo=%c\n",a->nodetype); printtree(a->l);
    case 'D': printf("nodo=%c\n",a->nodetype); printtree(a->l);
    break;
    default: printf("printtree - no se que paso\n");
  } 
}

void treefree(struct ast *a) {
  switch(a->nodetype) {
    case 'A': treefree(a->r);
    case 'B': treefree(a->r);
    case 'C': treefree(a->r);
    case 'D': treefree(a->r);
    /* no subtree */
    case 'K': free(a);
    break;
    default: printf("internal error: free bad node %c\n", a->nodetype);
  } 
}

void yyerror(char *s, ...) {
  va_list ap; va_start(ap, s);
  fprintf(stderr, "%d: error: ", yylineno);
  vfprintf(stderr, s, ap);
  fprintf(stderr, "\n");
}
