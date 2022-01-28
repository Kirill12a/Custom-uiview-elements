//
//  ViewController.swift
//  CustomElements
//
//  Created by Kirill Drozdov on 28.01.2022.
//


import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let frame = CGRect(x: 100, y: view.center.y, width: 250, height: 100)
    let cgView = CGView(frame: frame)
    self.view.addSubview(cgView)
  }
}

class CGView:UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    // Установите цвет фона для прозрачного, в противном случае это черный фон
    self.backgroundColor = UIColor.clear
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func draw(_ rect: CGRect) {
    super.draw(rect)

    // Получить контекст рисования
    guard let context = UIGraphicsGetCurrentContext() else {
      return
    }

    // создать прямоугольник, все из которых
    let drawingRect = self.bounds.insetBy(dx: 3, dy: 3)

    // Создать и установить путь
    let path = CGMutablePath()
    path.move(to: CGPoint(x:drawingRect.minX, y:drawingRect.minY))
    path.addLine(to:CGPoint(x:drawingRect.maxX, y:drawingRect.minY))
    path.addLine(to:CGPoint(x:drawingRect.maxX, y:drawingRect.maxY))

    // Установите тень
    context.setShadow(offset: CGSize(width:3, height:3), blur: 0.6,
                      color: UIColor.lightGray.cgColor)
    // добавить путь к графическому контексту
    context.addPath(path)
    //установите стиль конечной точки
    context.setLineCap(.round)
    // Установите тип соединения (округлый)
    context.setLineJoin(.round)
    // установить цвет кисти
    context.setStrokeColor(UIColor.red.cgColor)
    // Установите ширину Touch Pen
    context.setLineWidth(6)
    // нарисовать путь
    context.strokePath()
  }
}
