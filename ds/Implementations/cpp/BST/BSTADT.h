#include "binNodeADT.h"
#ifndef BSTADT_H
#define BSTADT_H
template <typename t> class BSTADT {
public:
  BSTADT();
  virtual ~BSTADT() = 0;
  virtual void inorder(BinNode<t> *n, void x(t i)) = 0;
  virtual void postorder(BinNode<t> *n, void x(t i)) = 0;
  virtual void preorder(BinNode<t> *n, void x(t i)) = 0;
  virtual bool remove(t v) = 0;
  virtual BinNode<t> *find(t i) = 0;
  virtual BinNode<t> *insert(t i) = 0;
  virtual BinNode<t> *findMin() = 0;
  virtual BinNode<t> *findMax() = 0;
};
#endif /* BSTADT_H */
