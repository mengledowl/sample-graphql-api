class SampleGraphhqlApiSchema < GraphQL::Schema
  max_depth 5
  middleware(GraphQL::Schema::TimeoutMiddleware.new(max_seconds: 5))

  query(Types::QueryType)
end
