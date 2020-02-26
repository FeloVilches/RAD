json.view do
  json.id @view.id
  json.project_id @view.project_id
  json.name @view.name
  json.readme @view.readme
  json.created_at @view.created_at
  json.updated_at @view.updated_at

  json.container do
    json.partial!("container", container: @view.container)
  end

  json.queries(@view.queries.where(published: true)) do |query|
    json.id query.id
    json.name query.name
    json.description query.description
    json.container do
      json.partial!("container", container: query.container)
    end

    # Connections that the user can execute.
    json.connections_allowed_to_user(query.connections_allowed_to(current_user)) do |conn|
      json.id conn.id
      json.name conn.name
    end
  end

end
