# Overview of ZK-SecreC language

![ZK-SecreC](https://raw.githubusercontent.com/zk-secrec/.github/main/profile/img/banner.png)

Zero-Knowledge (ZK) Proofs are a cryptographic technology used to convince Relying Parties that a statement holds, while not revealing them the evidence that makes that statement hold. While ZK Proofs are already widely used in certain real-world applications, and even more ubiquitously as subroutines in cryptographic functionalities, we believe that a well-design programming language will simplify their even more general uptake. Hence we have introduced the domain-specific language ZK-SecreC.

The power of ZK-SecreC ultimately derives from its type system, which is described and justified in the following research paper:
```bibtex
@inproceedings{zk-secrec-language,
  author       = {Dan Bogdanov and
                  Joosep J{\"{a}}{\"{a}}ger and
                  Peeter Laud and
                  H{\"{a}}rmel Nestra and
                  Martin Pettai and
                  Jaak Randmets and
                  Raul-Martin Rebane and
                  Ville Sokk and
                  Kert Tali and
                  Sandhra{-}Mirella Valdma},
  title        = {Z{K}-{S}ecre{C}: a Domain-Specific Language for Zero Knowledge Proofs},
  booktitle    = {37th {IEEE} Computer Security Foundations Symposium, {CSF} 2024, Enschede,
                  Netherlands, July 8-12, 2024},
  pages        = {372--387},
  publisher    = {{IEEE}},
  year         = {2024},
  doi          = {10.1109/CSF61375.2024.00010}
}
```
The technical report further expanding the description is available [here](https://doi.org/10.48550/arXiv.2203.15448).

The compiler of ZK-SecreC and the associated materials are published in three repositories:

* The [compiler](https://github.com/zk-secrec/compiler) repository contains the source code of the ZK-SecreC compiler, and the standard library of ZK-SecreC.
* The [examples](https://github.com/zk-secrec/examples) repository contains a number of smaller and larger example programs written in ZK-SecreC.
* The [documentation](https://github.com/zk-secrec/documentation) repository contains the source of the documentation. The documentation includes the introduction to ZK-SecreC language, and the language reference. It also includes the documentation of ZK-SecreC compiler, and the standard library.
  * The documentation is served [here](https://zk-secrec.github.io/documentation/).

Each repository contains a README-file describing the content of the repository, and the instructions of making use of the content.

The work on ZK-SecreC has mostly been funded by DARPA under contract no. HR0011-20-C-0083. The views, opinions, and/or findings expressed are those of the author(s) and should not be interpreted as representing the official views or policies of the Department of Defense or the U.S. Government. Additional funding has come from Estonian Research Council (grant no. PRG1780).