//
//  UnimplementedDatabaseReader.swift
//  UnimplementedGRDB
//
//  Created by Rhys Morgan on 29/08/2024.
//

import IssueReporting
@preconcurrency import GRDB

public final class UnimplementedDatabaseReader: DatabaseReader {
  public let configuration: Configuration = IssueReporting.unimplemented(
    "UnimplementedDatabaseReader.configuration",
    placeholder: Configuration()
  )

  public let path: String = IssueReporting.unimplemented("UnimplementedDatabaseReader.path", placeholder: "")

  public func read<T>(_ value: (Database) throws -> T) throws -> T {
    throw UnimplementedFailure(description: "UnimplementedDatabaseReader.read")
  }

  public func unsafeRead<T>(_ value: (GRDB.Database) throws -> T) throws -> T {
    throw UnimplementedFailure(description: "UnimplementedDatabaseReader.unsafeRead")
  }

  public func close() throws {
    throw UnimplementedFailure(description: "UnimplementedDatabaseReader.close")
  }

  public func interrupt() {
    IssueReporting.unimplemented("UnimplementedDatabaseReader.interrupt")
  }

  public func asyncRead(_ value: @escaping (Result<Database, any Error>) -> Void) {
    value(.failure(UnimplementedFailure(description: "UnimplementedDatabaseReader.asyncRead")))
  }

  public func asyncUnsafeRead(_ value: @escaping (Result<Database, any Error>) -> Void) {
    value(.failure(UnimplementedFailure(description: "UnimplementedDatabaseReader.asyncUnsafeRead")))
  }

  public func unsafeReentrantRead<T>(_ value: (Database) throws -> T) throws -> T {
    throw UnimplementedFailure(description: "UnimplementedDatabaseReader.unsafeReentrantRead")
  }

  public func _add<Reducer: ValueReducer>(
    observation: ValueObservation<Reducer>,
    scheduling scheduler: some ValueObservationScheduler,
    onChange: @escaping (Reducer.Value) -> Void
  ) -> AnyDatabaseCancellable {
    IssueReporting.unimplemented("UnimplementedDatabaseReader._add", placeholder: AnyDatabaseCancellable { })
  }
}

public extension DatabaseReader where Self == UnimplementedDatabaseReader {
  static var unimplemented: Self { Self() }
}
