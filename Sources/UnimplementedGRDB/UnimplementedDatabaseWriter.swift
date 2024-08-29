//
//  UnimplementedDatabaseWriter.swift
//  UnimplementedGRDB
//
//  Created by Rhys Morgan on 29/08/2024.
//

import IssueReporting
@preconcurrency import GRDB

public final class UnimplementedDatabaseWriter: DatabaseWriter {
  public let configuration: Configuration = IssueReporting.unimplemented(
    "UnimplementedDatabaseWriter.configuration",
    placeholder: Configuration()
  )

  public let path: String = IssueReporting.unimplemented("UnimplementedDatabaseWriter.path", placeholder: "")

  public func read<T>(_ value: (Database) throws -> T) throws -> T {
    throw UnimplementedFailure(description: "UnimplementedDatabaseWriter.read")
  }

  public func unsafeRead<T>(_ value: (GRDB.Database) throws -> T) throws -> T {
    throw UnimplementedFailure(description: "UnimplementedDatabaseWriter.unsafeRead")
  }

  public func close() throws {
    throw UnimplementedFailure(description: "UnimplementedDatabaseWriter.close")
  }

  public func interrupt() {
    IssueReporting.unimplemented("UnimplementedDatabaseWriter.interrupt")
  }

  public func asyncRead(_ value: @escaping (Result<Database, any Error>) -> Void) {
    value(.failure(UnimplementedFailure(description: "UnimplementedDatabaseWriter.asyncRead")))
  }

  public func asyncUnsafeRead(_ value: @escaping (Result<Database, any Error>) -> Void) {
    value(.failure(UnimplementedFailure(description: "UnimplementedDatabaseWriter.asyncUnsafeRead")))
  }

  public func unsafeReentrantRead<T>(_ value: (Database) throws -> T) throws -> T {
    throw UnimplementedFailure(description: "UnimplementedDatabaseWriter.unsafeReentrantRead")
  }

  public func _add<Reducer: ValueReducer>(
    observation: ValueObservation<Reducer>,
    scheduling scheduler: some ValueObservationScheduler,
    onChange: @escaping (Reducer.Value) -> Void
  ) -> AnyDatabaseCancellable {
    IssueReporting.unimplemented("UnimplementedDatabaseWriter._add", placeholder: AnyDatabaseCancellable { })
  }

  public func barrierWriteWithoutTransaction<T>(_ updates: (GRDB.Database) throws -> T) throws -> T {
    throw UnimplementedFailure(description: "UnimplementedDatabaseWriter.barrierWriteWithoutTransaction")
  }

  public func asyncBarrierWriteWithoutTransaction(_ updates: @escaping (Result<Database, any Error>) -> Void) {
    updates(.failure(UnimplementedFailure(description: "UnimplementedDatabaseWriter.asyncBarrierWriteWithoutTransaction")))
  }

  public func asyncWriteWithoutTransaction(_ updates: @escaping (Database) -> Void) {
    IssueReporting.unimplemented("UnimplementedDatabaseWriter.asyncWriteWithoutTransaction")
  }

  public func spawnConcurrentRead(_ value: @escaping (Result<Database, any Error>) -> Void) {
    value(.failure(UnimplementedFailure(description: "UnimplementedDatabaseWriter.spawnConcurrentRead")))
  }

  // MARK: - Currently Unimplementable methods
  public func writeWithoutTransaction<T>(_ updates: (Database) throws -> T) rethrows -> T {
    fatalError("Impossible to implement writeWithoutTransaction on UnimplementedDatabaseWriter")
  }

  public func unsafeReentrantWrite<T>(_ updates: (Database) throws -> T) rethrows -> T {
    fatalError("Impossible to implement unsafeReentrantWrite on UnimplementedDatabaseWriter")
  }

  public func concurrentRead<T>(_ value: @escaping (Database) throws -> T) -> DatabaseFuture<T> {
    fatalError("Impossible to implement concurrentRead on UnimplementedDatabaseWriter")
  }
}

public extension DatabaseWriter where Self == UnimplementedDatabaseWriter {
  static var unimplemented: Self { Self() }
}
