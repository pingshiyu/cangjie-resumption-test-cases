package cangjie_test_cases

import stdx.effect.*

class Fake<A> <: Command<A> {
    Fake(let arg: A) {}
}

func bugTrigger<X, A>(g: (A) -> A, f: (X) -> X): (X) -> X {{ x => 
    try {
        f(x)
    } handle(f: Fake<A>, r: Resumption<A, X>) {
        g(f.arg)
    }
}}