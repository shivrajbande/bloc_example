class IncrementEvent {
  const IncrementEvent();
}

class VariableUpdateEvent extends IncrementEvent {
  final int? x;
  const VariableUpdateEvent(this.x);
}
