<?php

namespace App\Http\Controllers;

use App\Users;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class UsersController extends Controller
{
    public function index()
    {
        $users = Users::latest()->get();

        return response(['data' => $users ], 200);
    }

    public function store(Request $request)
    {
        $users = Users::create($request->all());

        return response(['data' => $users ], 201);

    }

    public function show($id)
    {
        $users = Users::findOrFail($id);

        return response(['data', $users ], 200);
    }

    public function update(Request $request, $id)
    {
        $users = Users::findOrFail($id);
        $users->update($request->all());

        return response(['data' => $users ], 200);
    }

    public function destroy($id)
    {
        Users::destroy($id);

        return response(['data' => null ], 204);
    }
}
