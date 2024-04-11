# Copyright 2024 panda
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     https://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/usr/bin/env julia

using Pkg

function has_manifest_file()
    return isfile(joinpath(pwd(),"Manifest.toml")) || isfile(joinpath(pwd(),"JuliaManifest.toml"))
end

function has_project_file()
    return isfile(joinpath(pwd(),"Project.toml")) || isfile(joinpath(pwd(),"JuliaProject.toml"))
end

function is_package()
    return has_project_file() && !has_manifest_file()
end

function is_app()
    return has_project_file() && has_manifest_file()
end

if is_app()
    Pkg.activate(pwd())
    Pkg.instantiate()    
elseif is_package()
    Pkg.develop(path=pwd())    
end