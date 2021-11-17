protocol Observer {
	func update(value: Int)
}

public class SimpleObserver: Observer {

	private var value: Int = 0
	private var simpleSubject: Subject

	init(simpleSubject: Subject) {
		self.simpleSubject = simpleSubject
		simpleSubject.registerObserver(o: self)
	}

	public func update(value: Int) {
		self.value = value
		display()
	}

	public func display() {
		print("Value: \(value)")
	}

}

protocol Subject {
	func registerObserver(o: Observer)
	func removeObserver(o: Observer)
	func notifyObservers()
}

public class SimpleSubject: Subject {

	private var value = 0
	private var observers: [Observer] = []

	func registerObserver(o: Observer) {
		observers.append(o)
	}

	func removeObserver(o: Observer) {
		// TODO
	}

	public func notifyObservers() {

		for (_, item) in observers.enumerated() {
			item.update(value: value)
		}

	}

	public func setValue(value: Int) {
		self.value = value
		notifyObservers()
	}

}

var simpleSubject: SimpleSubject = SimpleSubject()
var simpleObserver: SimpleObserver =  SimpleObserver(simpleSubject: simpleSubject)
simpleSubject.setValue(value: 80)