package finalproj

import std.convert.* 
import std.console.* 
import std.math.*

let E=2.718281828459045

struct Complex{
    var real:Float64
    var image:Float64

    public init(real:Float64, image:Float64) {
        this.real = real
        this.image = image
    }

}

main() {
    let c1:Complex
    let c2:Complex
    var choice:String="0"

    // 输入两个复数
    println("输入z1的实部:")
    var real1:Float64 = readFloat()
    println("输入z1的虚部:")
    var imag1:Float64 = readFloat()

    println("输入z2的实部:")
    var real2:Float64 = readFloat()
    println("输入z2的虚部:")
    var imag2:Float64 = readFloat()

    c1 = Complex(real1, imag1)
    c2 = Complex(real2, imag2)



    // 菜单循环
    do {
        print("1. 加法\n")
        print("2. 减法\n")
        print("3. 乘法\n")
        print("4. 除法\n")
        print("5. 共轭\n")
        print("6. 绝对值\n")
        print("7. 幂运算\n")
        print("8. 退出\n")
        choice = Console.stdIn.readln().getOrThrow()

        if (choice == "1") {
            print("结果: ")
            print_complex(add(c1, c2))
            print("\n")
        } else if (choice == "2") {
            print("结果: ")
            print_complex(subtract(c1, c2))
            print("\n")
        } else if (choice == "3") {
            print("结果: ")
            print_complex(multiply(c1, c2))
            print("\n")
        } else if (choice == "4") {
            if (c2.real == 0.0 && c2.image == 0.0) {
                print("错误：不能除以 0 + 0i\n")
                print("\n")
            } else {
                print("结果: ")
                print_complex(divide(c1, c2))
                print("\n")
            }
        } else if (choice == "5") {
            print("共轭: ")
            print_complex(conjugate(c1))
            print("\n")
        } else if (choice == "6") {
            print("绝对值: ${abs_complex(c1)}\n")
            print("\n")
        } else if (choice == "7") {
            print("结果: ")
            print_complex(multiply_by_e(c1))
            print("\n")
        } else if (choice == "8") {
            print("已退出程序。\n")
        } else {
            print("无效的选择，请重新输入。\n")
        }

    } while (choice != "8")

}
// 复数加法
func add(a:Complex, b:Complex):Complex{
    return Complex(a.real + b.real, a.image + b.image)
}

// 复数减法
func subtract(a:Complex, b:Complex) :Complex{
    return Complex(a.real - b.real, a.image - b.image)
}

// 复数乘法
func multiply(a:Complex, b:Complex) :Complex{
    return Complex(a.real * b.real - a.image * b.image,a.real * b.image + a.image * b.real)
}

// 复数除法
func divide(a:Complex, b:Complex) :Complex{
    let fenmu:Float64 = b.real * b.real + b.image * b.image
    return Complex((a.real * b.real + a.image * b.image) / fenmu,(a.image * b.real - a.real * b.image) / fenmu)
}

// 复数共轭
func conjugate(a:Complex) :Complex{
    return Complex(a.real, -a.image)
}

// 复数绝对值
func abs_complex(a:Complex) :Float64{
    return sqrt(a.real * a.real + a.image * a.image)
}

// 复数幂运算
func multiply_by_e(a:Complex) :Complex{
    return Complex(E * a.real, E * a.image)
}

// 输出复数
func print_complex(a:Complex){
    if (a.image >= 0.0){
        print("${a.real} + ${a.image}i")
    }else{
        print("${a.real} - ${a.image}i")
    }
}

func readFloat(): Float64 {
    let number: Float64 = Float64.parse(Console.stdIn.readln().getOrThrow())
    return number
}